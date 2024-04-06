class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates_uniqueness_of :email
    validates :password, presence: true, length: { minimum: 6 }
    has_secure_password
    def generate_jwt
        expire_time = Time.now.to_i + 3600*48
        payload = { user_id: id, exp: expire_time }
        JWT.encode(payload,ENV['APP_SECRET_KEY'],'HS256')
    end
end
