require 'active_record'
require 'sqlite3'
require './models/user'
require './models/post'
require './models/comment'

ActiveRecord::Base.configurations = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection("development")

user1 = User.create! name: "Joe",   state: "England"

puts user1.inspect

post1 = user1.posts.create! title: "RoR introduction", content: "This is intoduction to Ruby on Rails."

puts post1.inspect

comment1 = post1.comments.create content: "This is great article!", user_id: user1.id
#comment1 = post1.comments.create content: "This is great article!"
#comment1.user = user1
#comment1.save
puts comment1.inspect