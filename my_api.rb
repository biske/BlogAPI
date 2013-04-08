require 'bundler/setup'
require './user'
require 'active_record'
Bundler.require

ActiveRecord::Base.configurations = YAML::load(IO.read('database.yml'))
ActiveRecord::Base.establish_connection("development")
ActiveRecord::Base.logger = Logger.new('debug.log')

class MyAPI < Grape::API
  format :json

  desc "Return a public timeline."
  get :test do
    #["Test value"]
    User.first
  end
end