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
  @avatar = "http://www.gravatar.com/avatar/df5702df61888046b35a4313fc4d4cdb?s=175"
  @bio_title = "About Me"
  @bio = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

  @twitter_url = "http://twitter.com/aterris"
  @github_url = "http://github.com/aterris"
  @linkedin_url = "http://www.linkedin.com/in/aterris"
  @forrst_url = "http://forrst.me/aterris"
  @dribble_url = "http://dribble.com"
  @foursquare_url = "http://foursquare.com/aterris"
  @gowalla_url ="http://gowalla.com/users/aterris"
  @facebook_url = "http://www.facebook.com/atterris"
  @blog_url = "http://wordpress.com"
  erb :profile
end

get '/login' do
  # login form
end

post '/login' do
  unless params[:user] = ENV['DOTME_USER'] || params[:pass] = ENV['DOTME_PASS'] do
    # don't match
  else
    # do match
  end
end

put '/update'
  data = JSON.parse request.body.read
end



# Errors
not_found do
  erb :'404'
end

error do
  @e = request.env['sinatra_error']
  erb :'500'
end
