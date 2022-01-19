class AddBtcpayServerIdToStores < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :btcpay_server_id, :string
  end
end
