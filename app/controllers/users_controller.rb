class UsersController < ApplicationController
  include ErrorSerializer
  skip_before_action :authenticate
  # skip_before_action :authenticate, only: [:create]
  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {}, status: 200
    else
      render json: ErrorSerializer.serialize(user.errors), status: 422
    end
  end

  private

    def user_params
      params.require(:user).permit(:user_type, :first_name, :last_name, :email, :phone_number, :grade_level, :address, :city, :state, :zipcode, :pref_language, :password, :password_confirmation)
    end


end
