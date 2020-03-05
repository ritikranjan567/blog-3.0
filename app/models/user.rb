class User < ApplicationRecord
    
    before_save :encrypt_password
    has_many :articles
    has_many :comments 
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    attr_accessor :password, :password_confirmation 

    validates :password, confirmation: true, length: {minimum:8}
    validates :password_confirmation, presence: true
    validates :security_answer, presence: true, length: {maximum: 30}

    def self.authenticate(email, password)
        user = User.find_by(email: email)
        user if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    end

    def encrypt_password
        if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
    end
end
