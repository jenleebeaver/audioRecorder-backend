class Api::V1::RecordingsController < ApplicationController

    def index
        @recordings = Recording.all
        render json: RecordingSerializer.new(@recordings)
    end

    def create
        parsed_json = ActiveSupport::JSON.decode(params[:recording]) 
        puts parsed_json
        @recording = Recording.new(parsed_json)
        @recording = Recording.create(title: parsed_json["title"], user_id: parsed_json["user_id"], audio_url: parsed_json["audio_url"])
        if @recording.save
            #status accepted allows us to send status codes with our fetch request - accepted/rejected and why 
            render json: @recording, status: :accepted
        else
            render json: {errors: @recording.errors.full_messages}, status: :unprocessible_entity
            #unprocessible_entity is telling us we are unable to process instructions 
        end
    end

    # //activestorage 
    def audio
        @recording = Recording.find_by(id: params[:id])

        if recording&.audio&.attached?
          redirect_to rails_representation_url(recording.audio)
        else
          head :not_found
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
            :audio_url,
            :audio [])
    end
end
