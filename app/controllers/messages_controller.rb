class MessagesController < ApplicationController

  def index
    render json: Message.all
  end

  def new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      render json: {}, status: 200
    else
      render json: ErrorSerializer.serialize(@message.errors), status: 422
    end
  end

  def show
    render json: Message.find(params[:id])
  end

  def edit
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      render json: {}, status: 200
    else
      render json: ErrorSerializer.serialize(@message.errors), status: 422
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      render status: 200
    else
      render json: ErrorSerializer.serialize(@message.errors), status: 422
    end
  end

private

private

  def message_params
    params.require(:message).permit(:title, :content, :user_id)
  end

end
