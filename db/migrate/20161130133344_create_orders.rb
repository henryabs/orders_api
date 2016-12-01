class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.integer :order_id
      t.integer :payment_transaction_id
      t.decimal :grand_total
      t.integer :promo_id
      t.datetime :created_at
      t.datetime :updated_at
      t.string :parent_order
      t.text :billing_address
      t.string :billing_country
      t.string :billing_city
      t.string :billing_zip_code
      t.text :shipping_address
      t.string :shipping_country
      t.string :shipping_city
      t.string :shipping_zip_code
      t.string :ship_to
      t.integer :customer_id
      t.integer :order_product_id
      t.integer :order_history_id
      t.timestamps null: false
    end
  end
end
