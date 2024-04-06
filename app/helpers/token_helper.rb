module TokenHelper
  def decode_token(token)
    puts "************************************************"
    JWT.decode(token, ENV['APP_SECRET_KEY'], true, algorithm: 'HS256')[0]
  rescue JWT::DecodeError
    nil
  end
end