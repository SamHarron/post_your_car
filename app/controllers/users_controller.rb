class UsersController < ApplicationController

    get '/signup' do
        user = User.new
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new params[:user]

        if user.save
            session[:user_id] = user.id
            redirect '/cars'
        else            
            erb :'users/signup'
        end
    end

    
end