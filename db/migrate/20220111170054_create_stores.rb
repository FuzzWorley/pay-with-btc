class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.integer :currency, null: false
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
