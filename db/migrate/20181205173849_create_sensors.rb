class CreateSensors < ActiveRecord::Migration[5.2]
  def change
    create_table :sensors do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :cls
      t.string :explanation
      t.integer :status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
    add_index :sensors, :cls
  end
end
