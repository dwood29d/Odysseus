class DepartmentsController < ApplicationController

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new()
  end

  def create
    @department = Department.new(team_params)
    if @department.save
      flash[:success] = "Congratulations! #{@department.name} has successfully been created!"
      redirect_to team_path(@department)
    else
      render 'new'
    end
  end

  def show
    @department = Department.find(params[:id])
    # @department_challenges = Department.challenges
  end


  private
  def department_params
    params.require(:department).permit(:name)
  end
end
