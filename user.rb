require 'active_record'

class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  has_many :comments
  
  attr_accessible :name, :state
end