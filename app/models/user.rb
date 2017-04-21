class User < ApplicationRecord
  # model associations
  has_many :user_clients
  has_many :clients, :through => :user_clients
  #validations
  validates_presence_of :first_name, :last_name, :email, :password
end
