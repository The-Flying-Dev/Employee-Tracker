class WorksController < ApplicationController
  before_action :set_work, only: [:show]

  def index 
    @works = Work.all
  end

  def show 
  end

  private 

  def set_work 
    @work = Work.find(params[:id])
  end

  def work_params 
    params.require(:work).permit(:datetimeperformed, :hours, :project_id, :user_id)
  end

end
