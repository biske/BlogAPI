require 'bundler/setup'

Bundler.require

class MyAPI < Grape::API
  format :json

  desc "Return a public timeline."
  get :test do
    ["Test value"]
  end
end