class Tags < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts_tags
  has_many :post through: :posts_tags
end


