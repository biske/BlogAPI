require 'active_record'

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  validates :content, :presence => true
  
  attr_accessible :content
end