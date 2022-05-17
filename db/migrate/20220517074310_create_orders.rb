class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :pay_way
      t.integer :postage
      t.integer :status
      t.string :postcode
      t.string :address
      t.string :address_name
      t.integer :total_pay

      t.timestamps
    end
  end
end
