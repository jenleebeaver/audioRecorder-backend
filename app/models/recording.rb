class Recording < ApplicationRecord

    belongs_to :user

    # ActiveStorage
    has_one_attached :audio

    validates :title, presence: true
    validates :audio_url, presence: true
end
