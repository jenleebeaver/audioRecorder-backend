class Api::V1::RecordingsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        @recordings = Recording.all
        render json: RecordingSerializer.new(@recordings)
    end

    def create
        # parsed_json = ActiveSupport::JSON.decode(params[:recording]) 
        @recording = Recording.new(recording_params)
        puts recording_params
        @recording = Recording.create(recording_params)
        # @recording = Recording.create(title: parsed_json["title"], user_id: parsed_json["user_id"], audio_url: parsed_json["audio_url"])
        if @recording.save
            #status accepted allows us to send status codes with our fetch request - accepted/rejected and why 
            render json: @recording, status: :accepted
        else
            render json: {errors: @recording.errors.full_messages}, status: :unprocessible_entity
            #unprocessible_entity is telling us we are unable to process instructions 
        end
    end

    def edit
        @recording = recordings.find(params[:id])
        # add current_user login   
      end
      
      def update
         # add current_user login    
        @recording = Recording.find_by(id: params[:id])
        @recording.update_attributes(recording_params)   
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
            :audio_url
            # :audio []
            )
    end
end
