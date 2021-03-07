class UsersController < ApplicationController

    get '/signup' do
        redirect '/cars' if logged_in?
        @user = User.new
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.new params[:user]

        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect '/signup'
        else
            @user.save
            session[:user_id] = @user.id
            redirect '/cars'
        end
    end

    get '/login' do
        redirect '/cars' if logged_in?
        erb :'users/login'
    end

    post '/login' do
        @user = User.find_by username: params[:user][:username]
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect '/cars'
        else
            redirect '/signup'
        end
    end

    get '/logout' do
        session.destroy if logged_in?
        redirect '/'
    end
end