class CarsController < ApplicationController

    get '/cars' do
        @cars = Car.all
        erb :'cars/index'
    end
 
    
end
