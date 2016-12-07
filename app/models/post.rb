class Post < ActiveRecord::Base
  has_many :post_tags 
  #con este comando siempre es plural
  has_many :tags, through: :post_tags
  validates :body, :presence => true
  validates :title, :presence => true

end



