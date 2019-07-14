class Article < ApplicationRecord
  belongs_to :user
  # Here we define all the constraints for the atrributes title and description that will show in the error messages

  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  validates :user_id, presence: true   #any time an article is created, it ensures that user_id is present

end
