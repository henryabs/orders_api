class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :sku
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :category_id
      t.string :tags
      t.datetime :created_at
      t.datetime :updated_at
      t.text :image_url
      t.timestamps null: false
    end
  end
end
