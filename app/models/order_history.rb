class OrderHistory < ApplicationRecord
  belongs_to :user
  belongs_to :client
end
