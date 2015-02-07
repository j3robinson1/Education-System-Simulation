class HomeworksController < ApplicationController
  def index
    @user = current_user
    if !params[:search].blank?
      @homeworks = Homework.where("name LIKE ?", "%#{params[:search]}%")
    else
      @homeworks = @user.homeworks
    end
  end 
  def new
    @user = current_user
    @users = User.all
    @homework = Homework.new
  end
  def create
    @users = User.all
    @user = current_user
    @homework = @user.homeworks.build(homework_params)
    if @homework.save
      flash[:notice] = 'homework was successfully added.'
      redirect_to user_homeworks_path(current_user)
    else
      flash[:error] = "Event was NOT added."
      render :new
    end
  end
  def show
    @users = User.all
    @user = current_user
    set_homework
  end
  def edit
    set_homework
    @users = User.all
    @user = current_user
  end
  def update
    set_homework
    @users = User.all
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
    @homework.destroy
    redirect_to user_homeworks_path
  end
private
  def set_homework
    @homework = Homework.find params[:id]
  end
  def homework_params
    params.require(:homework).permit(
      :name,
      :description,
      :user_id
      )
  end
end
