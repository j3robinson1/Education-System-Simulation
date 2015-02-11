class ClassesController < ApplicationController
  def index
    set_school
    if !params[:search].blank?
      @classes = Classe.where("name LIKE ?", "%#{params[:search]}%")
    else
      @classes = Classe.all
    end
  end 
  def new
    @classe = Classe.new
  end
  def create
    @classe = Classe.new(classe_params)
    if @classe.save
      flash[:notice] = 'classe was successfully added.'
      redirect_to school_classes_path(@school)
    else
      flash[:error] = "Event was NOT added."
      render :new
    end
  end
  def show
    set_school
    set_classe
  end
  def edit
    set_school
    set_classe
  end
  def update
    set_classe
    @classe.update_attributes classe_params
    if @classe.update_attributes classe_params
      flash[:notice] = 'classe was Successfully saved'
      redirect_to school_classes_path(set_school)
    else
      flash[:error] = 'classe was NOT saved'
      render :edit
    end
  end
  def destroy
    set_classe
    @classe.destroy
    redirect_to school_classes_path
  end
private
  def set_school
    @school = School.find params[:school_id]
  end
  def set_classe
    @classe = Classe.find params[:id]
  end
  def classe_params
    params.require(:classe).permit(
      :name,
      :description,
      :school_id
      )
  end
end
