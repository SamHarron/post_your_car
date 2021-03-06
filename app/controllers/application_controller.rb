require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "090716342825" 
    set :views, 'app/views' 
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
        !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end
end
