class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :due_date
      t.string :school
      t.boolean :completed

      t.timestamps
    end
  end
end
