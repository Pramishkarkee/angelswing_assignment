include TokenHelper
class ApplicationController < ActionController::API
end

def authentication
    token = request.headers['Authorization']&.split(' ')&.last
    puts token
    payload = decode_token(token)
    puts payload
    if payload.nil?
        render json: { error: 'Unauthorized' }, status: :unauthorized
    else
        @current_user = User.find(payload['user_id'])
    end
end

