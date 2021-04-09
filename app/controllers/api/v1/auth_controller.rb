class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        @user = User.find_by(email: user_login_params[:email])
        #authenticate comes from bcrypt
        if @user && @user.authenticate(user_login_params[:password])
            #encode token from ApplicationController
            token = encode_token({ user_id: @user.id })
        end
    end

    def user_login_params
        #params { user: {email: 'jen.lee.beaver@gmail.com', password:'hello101'} }
        params.require(:user).permit(
            :email,
            :password
        )
    end
end
