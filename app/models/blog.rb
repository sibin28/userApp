class Blog < ActiveRecord::Base
  attr_accessible :description, :title
   validates :title, :presence => true
#  validates_presence_of :title, :description
  has_many :posts
#has_one :blog
end
