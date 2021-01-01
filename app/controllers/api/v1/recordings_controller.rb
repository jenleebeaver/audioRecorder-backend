class Api::V1::RecordingsController < ApplicationController

    def index
        @recordings = Recording.all
        render json: @recordings
    end

    def create
        @recording = Recording.new(recording_params)
        if @recording.save
            #status accepted allows us to send status codes with our fetch request - accepted/rejected and why 
            render json: @recording, status: :accepted
        else
            render json: {errors: recording.errors.full_messages}, status: :unprocessible_entity
            #unprocessible_entity is telling us we are unable to process instructions 
        end
    end

    private 

    def recording_params
        #strong params allow only these attributes protects our data from injection attacks 
        params.require(:recording).permit(
            :title,
            :melody,
            :created_at,
            :updated_at,
            :user_id
        )
    end
end
