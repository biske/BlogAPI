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
  helpers do
    def logger
      API.logger
    end
  end

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
    
    desc "Delete last user."
    delete :last do
      User.last.destroy
    end
    
    desc "Get user posts"
    params do
      requires :id, :type => Integer, :desc => "User id."
    end
    get ":id/posts" do
      if params[:include]
        if params[:limit]
          Post.where(:user_id => params[:id]).limit(params[:limit].to_i).as_json(:include => {:comments => { :only => :content}})
        else
          User.find(params[:id]).posts.as_json(:include => {:comments => { :only => :content}})
        end
      else
        User.find(params[:id]).posts
      end
    end
    
    desc "Get last 5 user's posts."
    params do
      requires :id, :type => Integer, :desc => "User id."
    end
    get ":id/posts/last_five" do
      User.find(params[:id]).posts.order("created_at DESC").limit(5)
    end
    
    desc "Create new post."
    params do
      requires :id, :type => Integer, :desc => "User id."
    end
    post ":id/posts" do
      user = User.find(params[:id])
      user.posts.create title: params[:title], content: params[:content]
    end
    
    desc "Update post."
    params do
      requires :title,    :type => String, :desc => "Post title."
      requires :content,  :type => String, :desc => "Post content."
    end
    put ":id/posts/:post_id" do
      post = User.find(params[:id]).posts.find(params[:post_id])
      post.update_attributes title: params[:title], content: params[:content]
      post.save
    end
    
    desc "Delete last user's post."
    params do
      requires :id, :type => Integer, :desc => "User's id."
    end
    delete ":id/posts/last" do
      User.find(params[:id]).posts.order("created_at ASC").last.destroy
    end
  end
  
  #----------------------Posts----------------------------
  desc "Get one user post."
  params do
    requires :id, :type => Integer, :desc => "Post id."
  end
  get "posts/:id" do
    Post.find(params[:id])
  end
  
  #----------------------Comments------------------------- 
  desc "Get comments"
  get "posts/:id/comments" do
    Post.find(params[:id]).comments
  end
  
  desc "Create new comment."
  params do
    requires :id, :type => Integer, :desc => "Post id."
    requires :content, :type => String, :desc => "Comment content."
    requires :user_id, :type => Integer, :desc => "User id."
  end
  post "posts/:id/comments" do
    post = Post.find(params[:id])
    post.comments.create content: params[:content], user_id: params[:user_id] 
  end
  
  
end