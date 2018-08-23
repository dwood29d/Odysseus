class DepartmentsController < ApplicationController

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new()
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
