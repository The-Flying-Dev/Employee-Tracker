class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]

  def index 
    @projects = Project.all
  end

  def show 
   if !set_project 
     @project = Project.find(params[:id])
   end
     @work = Work.new 
     @work.project = @project 
  end

  def new 
    @project = Project.new 
  end

  def edit 
  end

  def create 
    @project = Project.new(project_params)

    if @project.save 
      redirect_to @project
    else  
      render 'new'
    end    
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else  
      render 'edit'
    end
  end

  private 

  # gem friendly_id params
  def set_project 
    @project = Project.friendly.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :rate, :department_id)
  end

end
