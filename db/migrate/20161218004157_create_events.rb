class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.references :textable, polymorphic: true

      t.timestamps
    end
  end
end
