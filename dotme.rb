# Models are defined in a separate File
require 'models'


# Set Content Type
before do 
  headers "Content-Type" => "text/html; charset=utf-8"
end

# Profile Page
get '/' do
  @title = "dotme"
  @email = "atterris@gmail.com"
  @avatar = "http://www.gravatar.com/avatar/df5702df61888046b35a4313fc4d4cdb?s=128"
  erb :profile
end

# Setup Page
get '/setup/?' do
  erb :setup
end

# Setup Page
get '/settings/?' do
  erb :settings
end

# Errors
not_found do
  erb :'404'
end

error do
  @e = request.env['sinatra_error']
  erb :'500'
end
