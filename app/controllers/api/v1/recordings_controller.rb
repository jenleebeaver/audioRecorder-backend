class Api::V1::RecordingsController < ApplicationController

    def index
        @recordings = Recording.all
        render json: @recordings
    end
end
