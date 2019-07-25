class ArticleCategory < ApplicationRecord
  #this model belongs to both article and category
belongs_to :article
belongs_to :category
end
