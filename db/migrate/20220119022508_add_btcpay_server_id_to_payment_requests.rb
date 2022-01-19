class AddBtcpayServerIdToPaymentRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :payment_requests, :btcpay_server_id, :string
  end
end
