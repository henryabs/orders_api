class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.integer :order_product_id
      t.integer :order_id
      t.integer :quantity
      t.integer :total_price
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :product_id
      t.timestamps null: false
    end
  end
end
