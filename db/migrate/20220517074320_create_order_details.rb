class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :production_status, null: false
      t.integer :quantity, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
