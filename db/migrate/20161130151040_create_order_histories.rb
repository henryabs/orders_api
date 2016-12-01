class CreateOrderHistories < ActiveRecord::Migration
  def change
    create_table :order_histories do |t|
      t.integer :order_history_id
      t.integer :order_id
      t.text :notify
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :order_status_id
      t.timestamps null: false
    end
  end
end
