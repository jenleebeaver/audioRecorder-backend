class User < ApplicationRecord
    has_many :recordings, dependent: :destroy
end
