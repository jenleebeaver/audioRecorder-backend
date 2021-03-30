class Api::V1::RecordingsController < ApplicationController

    def index
        @recordings = Recording.all
        render json: RecordingSerializer.new(@recordings)
    end

    def create
        parsed_json = ActiveSupport::JSON.decode(params[:recording])
        # @recording = Recording.new(recording_params)
        active_storage_attachments = params[:active_storage_attachments]
        puts active_storage_attachments
        @recording = Recording.create(title: parsed_json["title"], user_id: parsed_json["user_id"])
        @recording.audio.attach(params[:active_storage_attachments])
        puts @recording.audio.attach(params[:active_storage_attachments])
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
            :created_at,
            :updated_at,
            :user_id,
            :audio [])
    end
end
