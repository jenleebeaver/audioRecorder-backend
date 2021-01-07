class Recording < ApplicationRecord
    belongs_to :user
    has_many_attached :audio
end
