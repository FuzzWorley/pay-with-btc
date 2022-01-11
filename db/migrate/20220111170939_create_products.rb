class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.decimal :amount, null: false
      t.integer :category
      t.string :btcpayserver_search_terms
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
