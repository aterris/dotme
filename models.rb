## Classes ##
class Profile
  include DataMapper::Resource

  property :id,           Serial
  property :email,        String
  property :title,        String
  property :subtitle,     String
  property :caption,      String
  property :location,     String
  property :bio,          Text
  property :created_at,   DateTime
  property :updated_at,   DateTime
end

class Link
  include DataMapper::Resource

  property :id,               Serial
  property :link_name,        String
  property :link_value,       String
  property :created_at,       DateTime
  property :updated_at,       DateTime
end

class Option
  include DataMapper::Resource

  property :id,                 Serial
  property :font,               String
  property :background_color,   String
  property :header_text_color,  String
  property :body_text_color,    String
  property :created_at,         DateTime
  property :updated_at,         DateTime
end

# Finalize them models
DataMapper.finalize

# Setup Database For Local and Heroku
DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/dotme.db")

