class User < ActiveRecord::Base
  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :ideas
  has_many :likes
  validates :name, :alias, :email, :password, presence: true
  validates :email, confirmation: true, format: { with: email_regex }, uniqueness: { case_sensitive: false }
end
