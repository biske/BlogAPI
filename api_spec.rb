require 'rspec'
require './api'
require 'rack/test'

describe API do
  include Rack::Test::Methods
  

  def app
    API
  end

  describe API do
    describe "Users" do
      describe "Get all users (GET /users)" do
        it "returns all users" do
          get "/users"
          last_response.status.should be_equal 200
        end
      end
      
      describe "Get one user (GET /users/:id)" do
        it "returns user with given id" do
          get "/users/1"
          last_response.status.should be_equal 200
          JSON.parse(last_response.body)["user"]["name"].should be_eql "Joe"
        end
      end
      
      describe "Create new user" do
        it "Creates new user" do
          post "/users/", { name: "Maria", state: "Argentina" }
          last_response.status.should be_equal 201
        end
      end
      
      describe "Update user" do
        it "updates user" do
          put "users/3", { name: "Jimmy", state: "Australia"}
          last_response.status.should be_equal 200
        end
      end
      
      describe "Delete user" do
        it "deletes user" do
          delete "users/last"
          last_response.status.should be_equal 200
        end
      end
      
      # ---------------Posts----------------------
      describe "Get user posts" do
        it "should return all user posts with all comments" do
          get "users/1/posts", { include: true, limit: 3 }
          last_response.status.should be_equal 200
        end
        
        it "should return all user posts without comments" do
          get "users/1/posts", { include: false }
          last_response.status.should be_equal 200
        end
      end
      
      describe "Get last 5 user posts" do
        it "should return last 5 user posts" do
          get "users/1/posts/last_five"
          last_response.status.should be_equal 200
          JSON.parse(last_response.body).size.should be_eql 5
        end
      end
      
      describe "Get user post" do
        it "should return one user post" do
          get "posts/1"
          last_response.status.should be_equal 200
          JSON.parse(last_response.body).size.should be_eql 1
        end
      end
      
      describe "Create new post" do
        it "should create new post" do
          post "users/1/posts", { title: "From Java to Ruby", content: "This article exaplains moving from Java world to Ruby one."}
          last_response.status.should be_equal 201
        end
      end
      
      describe "Update post" do
        it "should update post" do
          put "users/1/posts/1", { title: "From C# to Ruby", content: "This article exaplains moving from C# world to Ruby one."}
          last_response.status.should be_equal 200
        end
      end
      
      describe "Delete post" do
        it "should delete user's last created post" do
          delete "users/1/posts/last"
          last_response.status.should be_equal 200
        end
      end
      
      # ---------------Comments----------------------
      describe "Get post comments" do
        it "should get post comments" do
          get "posts/1/comments"
          last_response.status.should be_equal 200
        end
      end
      
      describe "Create comment" do
        it "should create comment for post" do
          post "posts/1/comments", { content: "What a post!", user_id: 1 }
          last_response.status.should be_equal 201
        end
      end
    end
  end
end