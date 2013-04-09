require 'bundler/setup'
require './models/user'
require 'active_record'
Bundler.require

ActiveRecord::Base.configurations = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection("development")
ActiveRecord::Base.logger = Logger.new('log/debug.log')

class API < Grape::API
  format :json

  resource :users do
    desc "Return all users."
    get "/" do
      User.all
    end
    
    desc "Get user by id"
    params do
      requires :id, :type => Integer, :desc => "User id."
    end
    get ":id" do
      User.find(params[:id])
    end
  end
end