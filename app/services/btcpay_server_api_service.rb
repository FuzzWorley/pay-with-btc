class BtcpayServerApiService
  attr_reader :product_id, :amount, :access_token, :title, :email, :description

  BASE_URI = "https://btcpayserver.bitcoinjungle.app/api/v1/stores"

  def initialize(payment_request_params)
    @access_token = Rails.application.credentials.dig(:btcpay_server_token)
    @amount = payment_request_params["amount"]
    @title = payment_request_params["title"]
    @product_id =  payment_request_params["product_id"]
    @email = payment_request_params["email"]
    @description = payment_request_params["description"]
  end

  def create_payment_request
    raise 'btcpay server id for store is required' store_btcpay_server_id.present?

    HTTParty.post(
      "#{BASE_URI}/#{store_btcpay_server_id}/payment-requests",
      headers: headers,
      body: body
    )
  end

  private

  def store_btcpay_server_id
    store.btcpay_server_id
  end

  def store
    @store ||= product.store
  end

  def product
    @product ||= Product.find(product_id)
  end

  def currency
    store.currency
  end

  def headers
    { Authorization: "token #{access_token}",
      'Content-Type': 'application/json' }
  end

  def body
    {
      "amount": amount,
      "title": title,
      "currency": currency,
      "email": email,
      "description": description
    }.to_json
  end
end