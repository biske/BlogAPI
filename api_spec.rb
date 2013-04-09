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
          put "users/3", { name: "John", state: "Australia"}
          last_response.status.should be_equal 200
        end
      end
      
      describe "Delete user" do
        it "deletes user" do
          delete "users/last"
          puts last_response.status.inspect
          last_response.status.should be_equal 200
        end
      end
    end
  end
end