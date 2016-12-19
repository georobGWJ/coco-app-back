class CommentsController < ApplicationController
  skip_before_action :authenticate
  
  def index
    render json: Comment.all
  end

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: {}, status: 200
    else
      render json: ErrorSerializer.serialize(@comment.errors), status: 422
    end
  end

  def show
    render json: Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
    if @comment.save
      render json: {}, status: 200
    else
      render json: ErrorSerializer.serialize(@comment.errors), status: 422
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      render json: {}, status: 200
    else
      render json: ErrorSerializer.serialize(@comment.errors), status: 422
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render status: 200
    else
      render json: ErrorSerializer.serialize(@comment.errors), status: 422
    end
  end

private

  def comment_params
    params.require(:comment).permit(:content, :message_id, :user_id)
  end

end
