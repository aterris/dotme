# Models are defined in a separate File
require 'models'


# Set Content Type
before do 
  headers "Content-Type" => "text/html; charset=utf-8"
end

#Homepage
get '/' do
  @title = "dotme"
  erb :profile
end

# Errors
not_found do
  erb :'404'
end

error do
  @e = request.env['sinatra_error']
  erb :'500'
end
