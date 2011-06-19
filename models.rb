## Classes ##
class Profile
  include DataMapper::Resource

  property :id,           Serial, :key => true
  property :email,        String
  property :title,        String
  property :subtitle,     Text
  property :caption,      String
  property :location,     String
  property :bio,          Text
  property :created_at,   DateTime
  property :updated_at,   DateTime
end

class Link
  include DataMapper::Resource

  property :id,         Serial, :key => true
  property :name,       String
  property :url,        String
  property :created_at, DateTime
  property :updated_at, DateTime
end

class Option
  include DataMapper::Resource

  property :id,                 Serial, :key => true
  property :font,               String
  property :background_color,   String
  property :header_text_color,  String
  property :body_text_color,    String
  property :created_at,         DateTime
  property :updated_at,         DateTime
end

# Finalize them models
DataMapper.finalize

DataMapper::Logger.new($stdout, :debug)

# Setup Database For Local and Heroku
DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/dotme.db")

