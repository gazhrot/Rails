class EnterpriseUser < ApplicationRecord
  belongs_to :user
  belongs_to :enterprise
end
