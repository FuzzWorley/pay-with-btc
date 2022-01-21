require 'rails_helper'

RSpec.describe BtcpayServerApiService do
  describe '#create_payment_request' do
    subject { BtcpayServerApiService.new(params).create_payment_request }

    let(:product) { create(:product) }
    let(:params) {
      {
        "product_id"=>product.id,
        "amount"=>"88",
        "title"=>"Casa 2",
        "email"=>"bitcopia@gmail.com",
        "description"=>"invoice-hash-or-whatever"
      }
    }

    it 'makes a post request to btcpay server payment request' do
      expect(HTTParty).to receive(:post)
      subject
    end
  end
end
