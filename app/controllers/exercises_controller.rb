class ExerisesController < ApplicationController
  # before_action :is_admin?, only [:new, :create, :update, :destroy]
  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      flash[:success] = "Exercise #{@exercise.name} has been created with a worth of #{@exercise.worth}."
    else
      render 'new'
    end
  end

  def edit

  end


  def update

  end

  def show
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    flash[:danger] = "Exercise deleted"
    redirect_to exercises_path
  end

  private
  def exercise_params
    params.require(:team).permit(:name, :worth)
  end
end
