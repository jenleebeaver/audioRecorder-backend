class User < ApplicationRecord
    #dependent destroy allows associated objects to be destroyed alongside this object 
    has_many :recordings, dependent: :destroy 
    has_secure_password 
end
