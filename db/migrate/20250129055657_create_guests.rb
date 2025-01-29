class CreateGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, index: { unique: true, name: "unique_emails" }
      t.string :phone_numbers, array: true

      t.timestamps
    end
  end
end
