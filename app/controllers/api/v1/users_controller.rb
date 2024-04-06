class Api::V1::UsersController < ApplicationController
  before_action :authentication, only: [:show]
  def show
    user = User.find_by(id: @current_user.id)
    if user
      render json:user, status:200
    else
      render json: {error: "Not Found"}
    end
  end

  def create
    # todo password validation
    # todo email validation
    user = User.new(user_params)
    if user.save
      render json: {message: 'User Register successfully',status:200}
    else
      render json: {errors: user.errors.full_messages,ststus:404}
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def authorized_user?(user_id)
    @current_user.id == user_id.to_i
  end
end
