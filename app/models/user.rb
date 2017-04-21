class User < ApplicationRecord
  # model associations
  has_many :user_clients
  has_many :enterprise_users
  has_many :clients, :through => :user_clients
  has_many :enterprise, :through => :enterprise_users
  #validations
  validates_presence_of :first_name, :last_name, :email, :password
end
