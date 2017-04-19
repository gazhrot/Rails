class User < ApplicationRecord
  has_many :clients, dependent: :destroy
  #validations
  validates_presence_of :first_name, :last_name, :email, :password
end
