class Product < ApplicationRecord
  CATEGORIES = {
    lodging: 0,
    active: 1,
    explore: 2,
    relaxing: 3,
    food__and_drink: 4
  }.with_indifferent_access.freeze

  enum category: CATEGORIES

  belongs_to :store
  has_one_attached :image, dependent: :destroy

  validates_presence_of :category
  validate :validate_price_or_variable

  def formatted_price
    return 'Contact for price' if variable_pricing?
    # refactor this
    if store.btc?
      amount.to_formatted_s(:currency, unit: store.currency_symbol, precision: 0, format: '%n %u')
    else
      amount.to_formatted_s(:currency, unit: store.currency_symbol, format: '%u%n')
    end
  end

  private

  # add specs for this
  def validate_price_or_variable
    return if amount.present? || variable_pricing

    errors.add(:base, "Must have amount set if pricing is not variable")
  end
end
