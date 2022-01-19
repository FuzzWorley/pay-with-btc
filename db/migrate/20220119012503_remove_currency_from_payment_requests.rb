class RemoveCurrencyFromPaymentRequests < ActiveRecord::Migration[7.0]
  def change
    remove_column :payment_requests, :currency
  end
end
