class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,                     null: false
      t.string :item_image,                    null: false
      t.integer :item_category_id,             null: false
      t.integer :item_price_id,                null: false
      t.integer :item_sales_status_id,         null: false
      t.integer :item_prefecture_id,           null: false
      t.integer :item_scheduled_delivery_id,   null: false
      t.integer :item_shipping_fee_status_id,  null: false
      t.text :item_info,                       null: false
      t.references :user,                      foreign_key: true
      t.timestamps                             null: false
    end
  end
end