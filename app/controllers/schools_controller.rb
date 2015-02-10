class SchoolsController < ApplicationController
  def index
    if !params[:search].blank?
      @schools = School.where("name LIKE ?", "%#{params[:search]}%")
    else
      @schools = School.all
    end
  end 
  def select
    @user = current_user
    @schools = School.all
  end
  def new
    @school = School.new
  end
  def create
    @school = School.new(school_params)
    if @school.save
      flash[:notice] = 'school was successfully added.'
      redirect_to schools_path
    else
      flash[:error] = "Event was NOT added."
      render :new
    end
  end
  def show
    set_school
  end
  def edit
    set_school
  end
  def update
    set_school
    @school.update_attributes school_params
    if @school.update_attributes school_params
      flash[:notice] = 'school was Successfully saved'
      redirect_to schools_path
    else
      flash[:error] = 'school was NOT saved'
      render :edit
    end
  end
  def destroy
    set_school
    @school.destroy
    redirect_to schools_path
  end
private
  def set_school
    @school = School.find params[:id]
  end
  def school_params
    params.require(:school).permit(
      :name,
      :location
      )
  end
end
