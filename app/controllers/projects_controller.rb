class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_project_permission, only: [:permission_policy, :permission]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
    authorize_action_for @project
  end

  def edit
    authorize_action_for @project
  end

  def create
    @project = Project.new(project_params)
    authorize_action_for @project

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    authorize_action_for @project

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    authorize_action_for @project

    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def permission_policy

    authorize_action_for @project
    @users = User.at_who session[:username]

  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def set_project_permission
      @project = Project.find(params[:project_id])
    end

    def project_params
      params.require(:project).permit(:ptype, :keyname)
    end
end
