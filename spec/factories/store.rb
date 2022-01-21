FactoryBot.define do
  factory :store do
    name { 'Test Store' }
    currency { 1 }
    phone { '555-2423' }
    email { 'test@email.com' }
    btcpay_server_id { '298nc2oincd082noiunascd092' }
  end
end