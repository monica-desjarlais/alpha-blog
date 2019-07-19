class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  before_save {self.email = email.downcase} #set the email to lowercase, before saving it to db

validates :username, presence: true,  #username is not empty,

uniqueness: { case_sensitive: false }, #username is unique and ignores case sensitivity (eg: john -John)

length: { minimum: 3, maximum: 25 }   # has this length,

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i   #valid email format, stored in a constant

validates :email, presence: true, length: { maximum: 105 },

uniqueness: { case_sensitive: false },

format: { with: VALID_EMAIL_REGEX }  #will check for valid email format
has_secure_password
end
