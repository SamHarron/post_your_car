class CarsController < ApplicationController

    get '/cars/new' do
        erb :'/cars/new'
    end
end
