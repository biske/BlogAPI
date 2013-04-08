require 'active_record'
require 'sqlite3'
require './user'
require './post'
require './comment'

ActiveRecord::Base.configurations = YAML::load(IO.read('database.yml'))
ActiveRecord::Base.establish_connection("development")
#ActiveRecord::Base.logger = Logger.new('debug.log')


User.all.each do |user|
  puts "User id:\t#{user.id}"
  puts "User name:\t#{user.name}"
  puts "User state:\t#{user.state}"
  
  puts "Clanci:"
  user.posts.each do |post|
    puts post.content
  end
  puts "----------------------------------------------"
end
