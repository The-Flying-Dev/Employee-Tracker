class WorksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_work, only: %i[show edit update]

  # accessing the class method from work.rb
  # if the param is present then display the queried results otherwise display all items
  def index
    if params[:days]
      @works = Work.recently_worked_days(params[:days]).order('datetimeperformed desc')
    else
      @pagy, @works = pagy(Work.all.order('datetimeperformed desc'), items: 5)
    end
  end

  def show; end

  def new
    @work = current_user.works.build
  end

  def edit; end

  def create
    @work = current_user.works.build(work_params)
    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Work Created' }
        format.js {}
      else
        format.html { render 'new' }
        format.js {}
      end
    end
  end

  def update
    if @work.update(work_params)
      redirect_to @work
    else
      render 'edit'
    end
  end

  private

  def set_work
    @work = Work.find(params[:id])
  end

  def work_params
    params.require(:work).permit(:datetimeperformed, :hours, :project_id, :employee_id, :file)
  end
end
