require 'administrate/field/base'

class BtcpayServerLinkField < Administrate::Field::Base
  BASE_URL = 'https://btcpayserver.bitcoinjungle.app'

  def to_store_url
    "#{BASE_URL}/stores/#{data}"
  end

  def to_payment_request_url
    "#{BASE_URL}/payment-requests/#{data}"
  end
end
