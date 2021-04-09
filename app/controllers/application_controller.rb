class ApplicationController < ActionController::API
    #calls the authorized method before anything happens 
    before_action :authorized 

    #NOTE: JWT in flatiron curriculum 
    #STEP 1: Encode/Decode Tokens 
    #`JWT.encode` takes up to three args: payload to encode, 
    #an application secret, 
    #Optionally: hashing algorithm 
    #jwt.io encrypts our data by encoding our token 
    #using HS384 algorithm
    #every user gets an encoded token upon signup 
    def encode_token(payload)
        JWT.encode(payload, 'my_s3cr3t')
    end

    def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
    end

    #`JWT.decode` takes three args:
    #JWT as a string 
    #application secret 
    #opt: hashing algorithm
    def decode_token
        #token in header
        if auth_header
            #JWT as a string 
            token = auth_header.split(' ')[1]
            #header: { 'Authorization': 'Bearer <token>' }
            #begin/rescue allows us to rescue out of an exception in Ruby 
            begin
                #JWT as a string, app secret, and hashing algorithm
                JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end 

    #STEP 2: Authentication helper methods 
    def current_user
        if decode_token
            #returns an array
            #user_id is the key on our payload
            user_id = decode_token[0]['user_id']
            #using user_id to find our user
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    #STEP 3: Authorization helper methods 
    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

end
