class UsersController < ApplicationController

  before_action :require_same_team, only: [:show]

  def show
    @user = User.find(params[:id])
    @exercises = Exercise.all
  end

  def join_team
    @team = Team.find(params[:id])
    current_user.team = @team
    current_user.department = nil

    if current_user.save
      flash[:success] = "Successfully joined team!"
    else
      flash[:danger] = "There was a problem joining this team"
    end
    redirect_to team_path(@team)
  end

  def join_department
    @department = Department.find(params[:id])
    current_user.department = @department

    if current_user.save
      flash[:success] = "Successfully joined the department #{@department.name}!"
    else
      flash[:danger] = "There was a problem joining this department"
    end
    redirect_to department_path(@department)
  end

  def add_exercise
    # This is definitely broken
    @user = current_user
    @exercise = Exercise.find(params["user"]["exercises"]) # this returns nil. figure out why
    @number_of_reps = (params["number_of_reps"]["{:class=>\"form-control\"}"].to_f * @exercise.worth).round(2)

    @user.user_exercises.build(exercise: @exercise, number_of_reps: @number_of_reps)

    if current_user.save
      flash[:success] = "Your reps have been added! Keep at it!"
    else
      flash[:danger] = "There was a problem adding your reps. Please try again."
    end
    redirect_to user_path(@user)
  end

  private
  def require_same_team
    @user = User.find(params[:id])
    if current_user.team != @user.team # && !current_user.admin?
      flash[:danger] = "You may only access your team members"
      redirect_to root_path
    end
  end

end
