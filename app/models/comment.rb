class Comment < ActiveRecord::Base
  validates :commentor, :comments, :presence => true
  attr_accessible :commentor, :comments
  belongs_to :post
end
