class ChatsController < ApplicationController

  def index
    render json: Chat.all
  end

  def create
  end

end
