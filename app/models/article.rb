class Article < ActiveRecord::Base
  versioned
  has_many :comments, :dependent => :destroy
  attr_accessible :name, :description
end
