class CreateOrderHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :order_histories do |t|
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true
      t.date :order_date

      t.timestamps
    end
  end
end
