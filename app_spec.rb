require 'rspec'
require './my_api'
require 'rack/test'

describe MyAPI do
  include Rack::Test::Methods

  def app
    MyAPI
  end

  describe  do
    describe "GET /test" do
      it "returns empty array" do
        get "/test"
        last_response.status.should be_equal 200
        #JSON.parse(last_response.body).should == ["Test value"]
        JSON.parse(last_response.body).should == {"user"=>{"id"=>1, "name"=>"Nikola Nikolic", "state"=>"Srbija"}}
      end
    end
  end
end