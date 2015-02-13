class CoursesController < ApplicationController
  def index
    set_school
    if !params[:search].blank?
      @courses = Course.where("name LIKE ?", "%#{params[:search]}%")
    else
      @courses = Course.all
    end
  end 
  def new
    set_school
    @course = Course.new
  end
  def create
    set_school
    @course = @school.courses.new(course_params)
    if @course.save
      flash[:notice] = 'course was successfully added.'
      redirect_to school_courses_path(@school)
    else
      flash[:error] = "Event was NOT added."
      render :new
    end
  end
  def show
    set_school
    set_course
  end
  def edit
    set_school
    set_course
  end
  def update
    set_course
    @course.update_attributes course_params
    if @course.update_attributes course_params
      flash[:notice] = 'course was Successfully saved'
      redirect_to school_courses_path(set_school)
    else
      flash[:error] = 'course was NOT saved'
      render :edit
    end
  end
  def destroy
    set_course
    @course.destroy
    redirect_to school_courses_path
  end
private
  def set_school
    @school = School.find params[:school_id]
  end
  def set_course
    @course = Course.find params[:id]
  end
  def course_params
    params.require(:course).permit(
      :name,
      :description,
      :school_id
      )
  end
end
