# Models are defined in a separate File
require 'models'


# Set Content Type
before do 
  headers "Content-Type" => "text/html; charset=utf-8"
end

# Profile Page
get '/' do
  @title = "Andrew Terris"
  @email = "atterris@gmail.com"
  @subtitle = "I love coding"
  @avatar = "http://www.gravatar.com/avatar/df5702df61888046b35a4313fc4d4cdb?s=128"
  @bio_title = "About Me"
  @bio = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

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
