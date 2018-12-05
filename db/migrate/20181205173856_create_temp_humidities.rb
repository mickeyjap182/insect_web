class CreateTempHumidities < ActiveRecord::Migration[5.2]
  def change
    create_table :temp_humidities do |t|
      t.references :facility, foreign_key: true
      t.float :temp
      t.float :humidity
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
