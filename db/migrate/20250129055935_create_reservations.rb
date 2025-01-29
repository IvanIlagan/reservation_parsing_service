class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :nights, null: false

      t.string :status, null: false
    
      t.integer :number_of_adults, null: false
      t.integer :number_of_children, null: false
      t.integer :number_of_infants, null: false
      t.integer :total_guests, null: false

      t.string :payment_currency, null: false
      t.numeric :payout_price, null: false, precision: 12, scale: 2
      t.numeric :security_price, null: false, precision: 12, scale: 2
      t.numeric :total_price, null: false, precision: 12, scale: 2

      t.references :guest

      t.timestamps
    end
  end
end
