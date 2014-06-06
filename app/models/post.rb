class Post < ActiveRecord::Base
    attr_accessible :title, :description
    belongs_to :blog
    has_many :comments, :dependent => :destroy
    validates :title, :description, :presence => true
   # validates_presence_of :title, :message=>"hhhhh"
end
