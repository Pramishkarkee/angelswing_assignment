include TokenHelper
class ApplicationController < ActionController::API
end

def authentication
    token = request.headers['Authorization']&.split(' ')&.last
    payload = decode_token(token)
    if payload.nil?
        render json: { error: 'Unauthorized' }, status: :unauthorized
    else
        @current_user = User.find(payload['user_id'])
    end
end

