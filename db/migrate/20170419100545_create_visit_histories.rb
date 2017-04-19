class CreateVisitHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :visit_histories do |t|
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true
      t.date :visit_date

      t.timestamps
    end
  end
end
