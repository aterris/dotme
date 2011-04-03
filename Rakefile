require 'rubygems'
require 'bundler'

Bundler.require

require 'dotme'

desc "Run tests"
task :default => :test

desc "Run all Unit tests"
task :test do
   require 'rake/runtest'
   Rake.run_tests "test/*.rb"
   #puts 'wish i knew how to run this'
end

desc "Setup the database"
task :setup do
  DataMapper.auto_migrate!
  puts "Database reset."
end

desc "Migrate the database"
task :migrate do
  DataMapper.auto_upgrade!
  puts "Database migrated."
end
