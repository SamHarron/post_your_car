class CarsController < ApplicationController
    #Read
  get '/cars' do
    if logged_in?
      @cars = Car.all
      erb :'cars/index'
    else
      redirect '/login'
    end
  end

    #Create
  get '/cars/new' do
    if logged_in?
      erb :'/cars/new'
    else
      redirect '/login'
    end
  end

    #Create
  post '/cars' do
    if logged_in?
      @car = current_user.cars.build params[:car]
        if @car.save
          redirect "/cars"
        else
          redirect "/cars/new"
        end
    else
      redirect '/login'
    end
  end

  #Read
  get '/cars/:id' do
    if logged_in?
      @car = Car.find_by(id: params[:id])
      erb :'cars/show'
    else
      redirect '/cars'
    end
  end

  #Update
  #The Car does not get updated, it creates a new Listing.
  get '/cars/:id/edit' do
    @car = Car.find_by(id: params[:id])
    if @car && @car.user == current_user
      erb :'/cars/edit'
    else
      erb :'/cars/index'
    end
  end

  #Update
  patch '/cars/:id' do
    if logged_in?
      @car = Car.find_by(id: params[:id])
      if @car && @car.user == current_user
        @car.update(params[:car])
        redirect '/cars'
      else
        redirect '/cars'
      end
    end
  end

  #Delete
  #To successfully Delete, my Verb has to be Post.
  post '/cars/:id' do
    if logged_in?
      @car = Car.find_by(id: params[:id])
      if @car && @car.user == current_user
        @car.delete
      end
      redirect to '/cars'
    else
      redirect to '/login'
    end
  end
end
