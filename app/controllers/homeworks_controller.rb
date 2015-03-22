class HomeworksController < ApplicationController
  def index
    set_school
    set_course
    if !params[:search].blank?
      @homeworks = Homework.where("name LIKE ?", "%#{params[:search]}%")
    else
      @homeworks = @course.homeworks.all
    end
  end 
  def new
    set_course
    set_school
    @homework = Homework.new
  end
  def create
    set_school
    set_course
    @homework = @course.homeworks.create(homework_params)
    if @homework.save
      flash[:notice] = 'homework was successfully added.'
      redirect_to school_course_homeworks_path(@school, @course)
    else
      flash[:error] = "Event was NOT added."
      render :new
    end
  end
  def show
    set_homework
    set_course
    set_school
  end
  def edit
    set_course
    set_school
    set_homework
  end
  def update
    set_homework
    @homework.update_attributes homework_params
    if @homework.update_attributes homework_params
      flash[:notice] = 'Homework was Successfully saved'
      redirect_to user_homeworks_path(current_user)
    else
      flash[:error] = 'Homework was NOT saved'
      render :edit
    end
  end
  def destroy
    set_homework
    set_school
    set_course
    @homework.destroy
    redirect_to school_course_homeworks_path(@school, @course)
  end
private
  def set_homework
    @homework = Homework.find params[:id]
  end
  def set_school
    @school = School.find params[:school_id]
  end
  def set_course
    @course = Course.find params[:course_id]
  end
  def homework_params
    params.require(:homework).permit(
      :name,
      :description,
      :course_id
      )
  end
end
