class UsersController < ApplicationController

    get '/signup' do
        redirect to '/cars' if logged_in?
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

    get '/login' do
        redirect to '/cars' if logged_in?
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by username: params[:user][:username]
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect '/cars'
        else
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear if logged_in?
        redirect to '/'
    end


    
end