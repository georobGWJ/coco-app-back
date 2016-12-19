class RequirementsController < ApplicationController

  def information
  end

  def index
    p "**********************"
    p params[:user_id]
    p "**********************"
    @requirements = Requirement.where(user_id: params[:user_id])
    render json: @requirements
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

private

  def requirement_params
  end

end
