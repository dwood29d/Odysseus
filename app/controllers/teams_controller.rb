class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new()
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "Congratulations! #{@team.name} has successfully been created!"
      redirect_to team_path(@team)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @team.update(team_params)
      flash[:success] = "Team was successfully updated!"
      redirect_to team_path(@team)
    end
  end

  def show
    @team = Team.find(params[:id])
    @team_users = @team.users # .paginate(page: params[:page], per_page: 5)
    @team_departments = @team.departments
  end

  def search
    if params[:search_param].blank?
      flash.now[:danger] = "You have entered an empty search string"
    else
      @teams = Team.search(params[:search_param])
      flash.now[:danger] = "No teams match this search criteria" if @teams.blank?
    end
    respond_to do |format|
      format.js { render partial: 'teams/results' }
    end
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end

end
