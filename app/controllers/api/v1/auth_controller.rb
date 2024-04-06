class Api::V1::AuthController < ApplicationController
  def index
  end

  def show
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      expire_time = Time.now.to_i + 3600*48
      payload = {
        user_id: user.id,
        exp:expire_time
      }
      token = JWT.encode(payload,ENV['APP_SECRET_KEY'],'HS256')
      render json: { message: 'Logged in successfully', token: token }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
end
