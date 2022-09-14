class DepartmentsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_department, only: %i[show edit update]

  def index
    # @departments = Department.all

    # ransack query method
    @q = Department.ransack(params[:q])
    @departments = @q.result
  end

  def show
    respond_to do |format|
      format.html
      format.xml { render xml: @department }
      format.json { render json: @department }
    end
  end

  def new
    @department = current_user.departments.build
  end

  def edit; end

  def create
    @department = current_user.departments.build(department_params)

    if @department.save
      redirect_to @department
    else
      render 'new'
    end
  end

  def update
    if @department.update(department_params)
      redirect_to @department
    else
      render 'edit'
    end
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name, :notes)
  end
end
