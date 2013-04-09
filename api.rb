require 'bundler/setup'
require './models/user'
require './models/post'
require './models/comment'
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
    
    desc "Get user by id."
    params do
      requires :id, :type => Integer, :desc => "User id."
    end
    get ":id" do
      User.find(params[:id])
    end
    
    desc "Create new user."
    params do
      requires :name,   :type => String, :desc => "User name."
      requires :state,  :type => String, :desc => "User state."
    end
    post "/" do
      User.create name: params[:name], state: params[:state]
    end
    
    desc "Update user."
    params do
      requires :name,   :type => String, :desc => "User name."
      requires :state,  :type => String, :desc => "User state."
    end
    put ":id" do
      user = User.find(params[:id])
      user.update_attributes name: params[:name], state: params[:state]
      user.save
    end
    
    desc "Delete user."
    delete :last do
      User.last.destroy
    end
  end
end