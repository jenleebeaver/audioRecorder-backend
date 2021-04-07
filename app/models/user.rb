class User < ApplicationRecord
    #dependent destroy allows associated objects to be destroyed alongside this object 
    has_many :recordings, dependent: :destroy 
    has_secure_password 

    validates :name, presence: true
    validates :email, uniqueness: { case_sensitive: false }, presence: true
    validates :password,  presence: true, length: {in: 6..20, messsage: "Password must be between 6 and 20 characters."} 
end
