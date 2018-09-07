class ChallengesController < ApplicationController

  before_action :require_department, only: [:new, :create]

  def new
    @challenge = Challenge.new()
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      flash[:success] = "Congratulations! #{@challenge.name} have successfully been created"
      redirect_to challenge_path(@challenge)
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @users = @challenge.department.users
  end

  private
  def challenge_params
    defaults = { department: current_user.department }
    params.require(:challenge).permit(:name, :start_date, :end_date, :goal).reverse_merge(defaults)
  end

  def require_department
    @user = current_user
    if !@user.has_department? # && !current_user.admin?
      flash[:danger] = "You cannot yet create a challenge without joining a department"
      if @user.has_team?
        redirect_to team_path(@user.team)
      else
        redirect_to root_path
      end
    end
  end

  # def user_params
  # defaults = { name: 'A name' }
  # params.require(:user).permit(:name, :username, :email,
  #                              :password, :password_confirmation,
  #                              :avatar_link).reverse_merge(defaults)
  #                            end

end
