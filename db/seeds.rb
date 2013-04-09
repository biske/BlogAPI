# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require './user'
require 'active_record'

ActiveRecord::Base.configurations = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection("development")

User.create name: "John",   state: "England"
User.create name: "Ivica",  state: "Slovenia"
User.create name: "Marko",  state: "Serbia"
User.create name: "Oliver", state: "Germany"
User.create name: "Pit",    state: "USA"


