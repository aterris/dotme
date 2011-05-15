enable :sessions
set :session_fail, '/login'
set :session_secret, ENV['DOTME_SECRET']

require 'models'

# Set Content Type
before do 
  headers "Content-Type" => "text/html; charset=utf-8"
end

# Profile Page
get '/' do
  @dotme = session['dotme']
  
  if session?
    @profile = Profile.all
  else
    @profile = false
  end

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
  erb :index
end

get '/login' do
  if session?
    redirect /
  else
    erb :login
  end
end

post '/login' do
  unless params[:user] == ENV['DOTME_USER'] && params[:pass] == ENV['DOTME_PASS']
    session['dotme'] = false
    redirect '/login'
  else
    session['dotme'] = true
    redirect '/'
  end
end

get '/logout' do
  session_end!
  redirect '/'
end

put '/update' do
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
