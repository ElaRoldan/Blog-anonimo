class PostTag < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag
  #estos comandos siempre deben de ir en singular

end



