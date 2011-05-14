## Classes ##
class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :password, String
  property :email, String
  property :display_name, String
  property :created_at, DateTime
  property :updated_at, DateTime
end


class Profile
  include DataMapper::Resource

  property :id,     Serial
  property :title,    String
  property :subtitle,   String
  property :bio,    String
  property :avatar,   String
  property :twitter_url,  String
  property :github_url,   String
  property :linkedin_url, String
  property :forrst_url,   String
  property :dribble_url,  String
  property :foursquare_url, String
  property :gowalla_url,  String
  property :facebook_url, String
  property :blog_url,   String
  property :user_id,    Integer
  property :created_at,   DateTime
  property :updated_at,   DateTime
end

class Options
  include DataMapper::Resource

  property :id,     Serial
  property :background_color, String
  property :user_id,    Integer
  property :created_at,   DateTime
  property :updated_at,   DateTime
end

# Finalize them models
DataMapper.finalize

# Setup Database For Local and Heroku
DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/dotme.db")
