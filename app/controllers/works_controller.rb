class WorksController < ApplicationController
  before_action :set_work, only: [:show]

  # accessing the class method from work.rb
  # if the param is present then display the queried results otherwise display all items
  def index 
    if (params[:days])
      @works = Work.recently_worked_days(params[:days]).order('datetimeperformed desc') 
    else  
      @works = Work.all.order('datetimeperformed desc')
    end
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
