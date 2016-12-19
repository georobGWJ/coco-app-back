class ApplicationsController < ApplicationController

  def index
    render json: Application.all
  end

  def new
  end

  def create
  end

  def show
    render json: Application.find(params[:id])
  end

end
