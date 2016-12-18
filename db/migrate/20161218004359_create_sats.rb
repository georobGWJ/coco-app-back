class CreateSats < ActiveRecord::Migration[5.0]
  def change
    create_table :sats do |t|
      t.date :date
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.boolean :completed
      t.string :test_location

      t.timestamps
    end
  end
end
