class Recording < ApplicationRecord

    belongs_to :user

    # ActiveStorage
    has_one_attached :audio

end
