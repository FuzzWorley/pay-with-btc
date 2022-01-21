FactoryBot.define do
  factory :product do
    association :store, factory: :store
    amount { Faker::Number.number(digits: 3) }
    category { 0 }
    # btcpayserver_search_terms
    # t.boolean "variable_pricing", default: false, null: false
    description { 'Test description' }
    name { 'Test Store' }
    # featured { true }
    # live { true }
  end
end