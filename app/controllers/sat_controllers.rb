class SatsController < ApplicationController

  def index
    render json: Sat.all
  end

  def show
    render json: Sat.find(params[:id])
  end

end
