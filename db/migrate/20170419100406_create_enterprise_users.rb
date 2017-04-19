class CreateEnterpriseUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :enterprise_users do |t|
      t.references :user, foreign_key: true
      t.references :enterprise, foreign_key: true
      t.int :role

      t.timestamps
    end
  end
end
