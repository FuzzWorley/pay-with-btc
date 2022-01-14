class Store < ApplicationRecord
  CURRENCIES = {
    btc: 0,
    usd: 1,
    crc: 2
  }.with_indifferent_access.freeze

  CURRENCY_SYMBOLS = {
    btc: "sats",
    usd: "$",
    crc: "₡"
  }.with_indifferent_access.freeze

  enum currency: CURRENCIES

  has_many :products, dependent: :destroy
  belongs_to :admin, optional: true

  validates_presence_of :name, :currency

  def currency_symbol
    CURRENCY_SYMBOLS[currency]
  end
end
