class ChatsController < ApplicationController
  skip_before_action :authenticate
  def index
    render json: Chat.all
  end

  def show
    render json: Chat.find(params[:id])
  end

  def create
  end

end
