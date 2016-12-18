class CreateTips < ActiveRecord::Migration[5.0]
  def change
    create_table :tips do |t|
      t.string :text
      t.boolean :completed

      t.timestamps
    end
  end
end
