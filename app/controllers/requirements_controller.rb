class RequirementsController < ApplicationController
  skip_before_action :authenticate
  
  def information
  end

  def index
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
