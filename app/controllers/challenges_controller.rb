class ChallengesController < ApplicationController

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
    params.require(:challenge).permit(:name, :start_date, :end_date)
  end

end
