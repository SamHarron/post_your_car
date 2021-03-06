class CarsController < ApplicationController

    get '/cars' do
        erb :'cars/index'
    end
 
    
end
