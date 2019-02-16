class CreateTempHumidities < ActiveRecord::Migration[5.2]
  def change
    create_table :temp_humidities do |t|
      t.references :sensor, foreign_key: true
      t.float :temp
      t.float :humidity
      t.datetime :inspected_at
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
    add_index :temp_humidities, %i(inspected_at), unique: false
  end
end
