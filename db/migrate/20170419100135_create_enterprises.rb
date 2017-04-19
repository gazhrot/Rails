class CreateEnterprises < ActiveRecord::Migration[5.1]
  def change
    create_table :enterprises do |t|
      t.string :code_enterprise
      t.string :name

      t.timestamps
    end
  end
end
