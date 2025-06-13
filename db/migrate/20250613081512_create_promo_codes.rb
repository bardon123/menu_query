class CreatePromoCodes < ActiveRecord::Migration[8.0]
  def change
    create_table :promo_codes do |t|
      t.string :code
      t.string :discount_type
      t.decimal :discount_value
      t.datetime :expires_at
      t.integer :usage_limit
      t.integer :times_used
      t.boolean :active

      t.timestamps
    end
    add_index :promo_codes, :code, unique: true
  end
end
