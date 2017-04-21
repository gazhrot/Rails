class Enterprise < ApplicationRecord
  # model associations
  has_many :enterprise_users
  has_many :users, :through => :enterprise_users
  #validations
  validates_presence_of :name
  end
