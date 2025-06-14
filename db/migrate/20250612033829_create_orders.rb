class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.float :total_price
      t.string :status

      t.timestamps
    end
  end
end
