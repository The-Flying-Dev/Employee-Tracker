class EmployeesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_employee, only: [:show, :edit, :update]

  def index 
    @employees = Employee.all
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

  def edit 
  end

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
    params.require(:employee).permit(:fname, :lname, :department_id)
  end
end
