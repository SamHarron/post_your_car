class CarsController < ApplicationController
    #Create
  get '/cars/new' do
    @car = Car.new
    erb :'/cars/new'
  end

    #Create
  post '/cars' do
    @car = Car.new(params[:car])

    if @car.save
      redirect '/cars'
    else
      erb :'/cars/new'
    end
  end 

  #Read
  get '/cars' do
    if logged_in?
      @cars = Car.all
      erb :'cars/index'
    else
      redirect '/signup'
    end
  end

  #Read
  get '/cars/:id' do
    @car = Car.find_by(id: params[:id])
    if @car
      erb :'cars/show'
    else
      redirect '/cars'
    end
  end

  #Update
  get '/cars/:id/edit' do
    @car = Car.find_by(id: params[:id])
    if @car.user_id == session[:user_id]
      erb :'/cars/edit'
    else
      erb :'/cars/index'
    end
  end

  #Update
  put '/cars/:id' do
    @car = Car.find_by(id: params[:id])
    if @car.update(params[:car])
      redirect "/cars/#{params[:id]}"
    else
      erb :'/cars/edit'
    end
  end

  #Delete
  #To successfully Delete, my Verb has to be Post.
  post '/cars/:id' do
    require_logged_in
    @car = Car.find_by(id: params[:id])
    if @car
    @car.delete
    end
    redirect '/cars'
  end
    
end
