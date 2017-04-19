class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :code_enterprise
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.int :role
      t.string :token

      t.timestamps
    end
  end
end
