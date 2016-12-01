class CreateOrderListXes < ActiveRecord::Migration
  def change
    create_table :order_list_xes do |t|
      t.integer :order_number
      t.integer :uid
      t.string :sku
      t.string :status
      t.timestamps null: false
    end
  end
end
