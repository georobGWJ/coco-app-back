class RequirementsController < ApplicationController

  def information
  end

  def index
    @requirements = Requirements.find_by(user_id: params[:id])
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
