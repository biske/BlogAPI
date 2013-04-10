require 'active_record'
require_relative "../models/user.rb"
require_relative "../models/post.rb"
require_relative "../models/comment.rb"

ActiveRecord::Base.configurations = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection("development")

User.destroy_all

user1 = User.create name: "Joe",   state: "England"
user2 = User.create name: "Ivica",  state: "Slovenia"
user3 = User.create name: "Marko",  state: "Serbia"
user4 = User.create name: "Oliver", state: "Germany"
user5 = User.create name: "Pit",    state: "USA"

post1 = user1.posts.create title: "RoR introduction",     content: "This is intoduction to Ruby on Rails."
user1.posts.create title: "Grape framework",              content: "This is article about grape framework."
user1.posts.create title: "Ruby metaprogramming",         content: "Metaprograming is Ruby core feature."
user1.posts.create title: "RoR associations",             content: "It's article about Ruby on Rails associations"
user1.posts.create title: "Dive into AR.",                content: "This article will help you to deeply understand how active record works."
user1.posts.create title: "Test Driven Development",      content: "Intro to Test Driven Development"
user1.posts.create title: "Behavioral Driven Develpment", content: "Intro to Behavioral Driven Develompent"

post1.comments.create content: "Greate article!",                     user_id: user1.id
post1.comments.create content: "I don't like this style.",            user_id: user1.id
post1.comments.create content: "You have bug in code on line 23 :)",  user_id: user1.id
post1.comments.create content: "LOL",                                 user_id: user3.id
post1.comments.create content: "Some comment",                        user_id: user2.id