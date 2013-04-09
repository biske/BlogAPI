require 'rspec'
require './api'
require 'rack/test'

describe API do
  include Rack::Test::Methods

  def app
    API
  end

  describe API do
    describe "GET /users" do
      it "returns all users" do
        get "/users"
        last_response.status.should be_equal 200
        JSON.parse(last_response.body).size.should be_equal 5
      end
    end
    
    describe "GET /users/:id" do
      it "returns user with given id" do
        #user = User.new name: "John", state: "England"
        get "/users/1"
        last_response.status.should be_equal 200
        puts JSON.parse(last_response.body)["user"]["name"].inspect
        JSON.parse(last_response.body)["user"]["name"].should be_eql "Joe"
      end
    end
  end
end