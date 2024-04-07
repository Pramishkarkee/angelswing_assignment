class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true ,format: { with: URI::MailTo::EMAIL_REGEXP }
    validates_uniqueness_of :email
    validates :password, presence: true, length: { minimum: 6 }
    has_secure_password
    validate :password_complexity
    def generate_jwt
        expire_time = Time.now.to_i + 3600*48
        payload = { user_id: id, exp: expire_time }
        JWT.encode(payload,ENV['APP_SECRET_KEY'],'HS256')
    end

    private
    def password_complexity
        return if password.blank?
    
        unless password.match?(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[[:^alnum:]])/)
          errors.add :password, 'must include at least one uppercase letter, one lowercase letter, one digit, and one special character'
        end
    end
end
