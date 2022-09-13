class EmployeesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_employee, only: %i[show edit update]

  def index
    @employees = Employee.all

    # feature to download csv file
    respond_to do |format|
      format.html
      format.csv do
        send_data Employee.export_csv(@employees), type: 'text/csv; charset=utf-8; header=present',
                                                   disposition: 'attachment; filename=employees.csv'
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml { render xml: @employee }
      format.json { render json: @employee }
    end    
  end

  def new
    @employee = current_user.employees.build
  end

  def edit; end

  def create
    @employee = current_user.employees.build(employee_params)

    if @employee.save
      redirect_to @employee
    else
      render 'new'
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render 'edit'
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:fname, :lname, :email, :phone, :department_id)
  end
end
