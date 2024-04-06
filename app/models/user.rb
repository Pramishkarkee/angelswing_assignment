class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates_uniqueness_of :email
    validates :password, presence: true, length: { minimum: 6 }
    has_secure_password
    def generate_jwt
        payload = { user_id: id }
        JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
    end
end
