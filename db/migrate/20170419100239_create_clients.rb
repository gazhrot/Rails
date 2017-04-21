class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.date :last_order_date
      t.date :last_visit_date

      t.timestamps
    end
  end
end
