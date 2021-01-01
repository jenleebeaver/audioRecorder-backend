class Api::V1::RecordingsController < ApplicationController
    before_action :find_note, only: [:update]

    def index
        @users = User.all
        render json: @users
    end
end
