require './config/environment'
require './app/models/user'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    use Rack::Flash
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

end