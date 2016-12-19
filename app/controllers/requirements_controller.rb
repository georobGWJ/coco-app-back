class RequirementsController < ApplicationController

  def information
  end

  def index
    render json: Requirement.all
  end

  def new
  end

  def create
    @requirement = Requirement.new(requirement_params)
    if @requirement.save
      render json: {}, status: 200
    else
      render json: ErrorSerializer.serialize(@requirement.errors), status: 422
    end
  end

  def show
    render json: Requirement.find(params[:id])
  end

  def edit
  end

  def update
    @requirement = Requirement.find(params[:id])
    if @requirement.update(requirement_params)
      render json: {}, status: 200
    else
      render json: ErrorSerializer.serialize(@requirement.errors), status: 422
    end
  end

private

  def requirement_params
    params.require(:requirement).permit(:subject, :years, :user_id)
  end

end
