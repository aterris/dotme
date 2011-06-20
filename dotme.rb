enable :sessions
use Rack::Flash

require 'models'
require 'digest/md5'

before do
  headers "Content-Type" => "text/html; charset=utf-8" # Set Content Type
end

# Profile Page
get '/' do
  @dotme = session['dotme']

  if Profile.count == 0
    if session['dotme']
      @title = 'dotme setup'
      ['portfolio','twitter','facebook','github','forrst','dribble','linkedin','gowalla','foursquare'].each do |l|
        link = Link.first_or_create(:name => l, :url => '')
      end
    else
      redirect '/login'
    end
  else
    @profile = Profile.get(1)
    email_digest = Digest::MD5.hexdigest(@profile.email)
    @avatar = "http://www.gravatar.com/avatar/#{email_digest}?s=512&d=retro"
    @links = Link.all()
    @options = Option.all()
  end
  erb :index
end

get '/login' do
  @title = 'dotme login'
  if session['dotme']
    flash[:notice] = 'You are already logged in.'
    redirect '/'
  else
    erb :login
  end
end

post '/login' do
  unless params[:user] == ENV['DOTME_USER'] && params[:pass] == ENV['DOTME_PASS']
    flash[:error] = 'Username and/or password is not correct.'
    redirect '/login'
  else
    flash[:notice] = 'Log in succesful.'
    session['dotme'] = true
    redirect '/'
  end
end

get '/logout' do
  session['dotme'] = nil
  flash[:notice] = 'You have been logged out successfully.'
  redirect '/'
end

put '/update' do
  data = JSON.parse request.body.read
end

post '/setup' do
  if session['dotme']
    profile = Profile.first_or_create(:email => params[:email], :title => params[:title], :subtitle => params[:subtitle], :caption => params[:caption], :location => params[:location], :bio => params[:bio] )
    flash[:notice] = 'Profile created. Continue customizing it.'
  end
  redirect '/'
end

# Errors
not_found do
  erb :'404'
end

error do
  @e = request.env['sinatra_error']
  erb :'500'
end
