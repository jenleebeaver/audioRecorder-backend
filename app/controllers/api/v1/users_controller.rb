class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        @users = User.all
        render json: UserSerializer.new(@users)
        #Another option to access associated attributes instead of adding them to the serializer 
        #options = {
            #include: [:recordings]
        #}
        #then you have to pass options into the render json line
    end

    def create
        #creating new User and render the data or errors if it fails 
        # @user = User.new(user_params)
        @user = User.create(user_params)
        if @user.valid?
            #create token, encode token, and passing payload of user_id
            @token = encode_token(user_id: @user.id)
            #using built-in rails status codes 
            #jwt key is in json as a token (string)
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: {error: 'failed to create user'}, status: :not_acceptable
            #unprocessible_entity is telling us we are unable to process instructions: httpstatus.com
        end
    end

    private 

    def user_params
        #strong params allow only these attributes protects our data from injection attacks 
        params.require(:user).permit(
            :name,
            :email,
            :password,
            :image_url
        )
    end
end
