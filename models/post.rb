require 'active_record'

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  validates :title, :length => { :in => 6..40 }
  
  attr_accessible :title, :content
end