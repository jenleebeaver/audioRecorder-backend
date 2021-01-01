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
        @user = User.new(user_params)
        if @user.save
            #status accepted allows us to send status codes with our fetch request - accepted/rejected and why 
            render json: @user, status: :accepted
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessible_entity
            #unprocessible_entity is telling us we are unable to process instructions: httpstatus.com
        end
    end

    private 

    def user_params
        #strong params allow only these attributes protects our data from injection attacks 
        params.require(:user).permit(
            :name
        )
    end
end
