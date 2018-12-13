class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.date :birthday
      t.text :password
      t.integer :status
      t.integer :cls
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
    add_index :users, :email
  end
end
