class CreateOrderLists < ActiveRecord::Migration
  def change
    create_table :order_lists do |t|
      t.integer :order_number
      t.integer :uid
      t.string :sku
      t.integer :quantity
      t.string :status
      t.timestamps null: false
    end
  end
end
