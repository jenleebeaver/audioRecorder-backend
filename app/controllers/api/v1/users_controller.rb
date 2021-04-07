class Api::V1::UsersController < ApplicationController
    before_action :find_note, only: [:update]

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
            #using built-in rails status codes 
            render json: { user: UserSerializer.new(@user) }, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessible_entity
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
            :image_url,
            :password_digest
        )
    end
end
