class Api::V1::RecordingsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :update, :destroy]
    include ApplicationHelper

    def index
       # Below code test code for finding current_user.recordings
        # token = params['user_id'];
        # @payload = JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
        # user_id = @payload[0]['user_id']
        # # if current_user
        #     @recordings = Recording.find_by({user_id: user_id})
            @recordings = Recording.all
            # think about auth_controller
            # @recordings = profile.recordings
            # @recordings = Recording.find_by(:user_id)
            render json: RecordingSerializer.new(@recordings)
        # end
    end

    def create
       
        # parsed_json = ActiveSupport::JSON.decode(params[:recording])
        # # hash = recording_params
        # # hash = JSON.parse(hash) if hash.is_a?(String)
        # # @recording = Recording.new(hash) 
        # # puts recording_params
        # # JSON.stringify({ name : "AA" })
        # recording = JSON.stringify({ title: parsed_json["title"], user_id: parsed_json["user_id"], audio_url: parsed_json["audio_url"] })
        # @recording = Recording.create(recording_params)
        # title: parsed_json["title"], user_id: parsed_json["user_id"], audio_url: parsed_json["audio_url"]
        token = params['user_id'];
        @payload = JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
        user_id = @payload[0]['user_id']
        
        # parsed_json = ActiveSupport::JSON.decode(params[:recording])
        @recording = Recording.create({title: params["title"], user_id: user_id, audio_url: params["audio_url"]})  
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
        find_by
        @recording.update_attributes(recording_params)   
      end

      def destroy 
        find_by
        @recording.destroy
      end

    # //activestorage 
    def audio
        find_by

        if recording&.audio&.attached?
          redirect_to rails_representation_url(recording.audio)
        else
          head :not_found
        end
    end

    private 

    # build find_by helper method
    def find_by
        @recording = Recording.find_by(id: params[:id])     
    end

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
