class CreateOrderItemModifiers < ActiveRecord::Migration[8.0]
  def change
    create_table :order_item_modifiers do |t|
      t.references :order_item, null: false, foreign_key: true
      t.references :modifier, null: false, foreign_key: true
      t.timestamps
    end
  end
end 