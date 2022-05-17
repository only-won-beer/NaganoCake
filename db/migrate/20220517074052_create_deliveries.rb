class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.integer :customer_id
      t.string :address_name
      t.string :postcode
      t.string :address

      t.timestamps
    end
  end
end
