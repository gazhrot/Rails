class Client < ApplicationRecord
  # model associations
  has_many :user_clients
  has_many :users, :through => :user_clients
  # validations
  validates_presence_of :name
end
