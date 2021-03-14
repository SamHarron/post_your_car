require './config/environment'
use Rack::MethodOverride #middleware, allows us to use patch.

run ApplicationController
use CarsController
use UsersController
