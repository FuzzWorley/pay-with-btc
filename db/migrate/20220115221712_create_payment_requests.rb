class CreatePaymentRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_requests do |t|
      t.string :amount
      t.string :title
      t.string :currency
      t.string :email
      t.string :description
      t.integer :expiry_date
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
