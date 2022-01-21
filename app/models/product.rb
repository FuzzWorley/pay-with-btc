class Product < ApplicationRecord
  CATEGORIES = {
    lodging: 0,
    active: 1,
    explore: 2,
    relaxing: 3,
    food_and_drink: 4
  }.with_indifferent_access.freeze

  enum category: CATEGORIES

  belongs_to :store
  has_one_attached :image, dependent: :destroy

  validates_presence_of :category
  validate :validate_price_or_variable, :validate_position_if_featured

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

  def validate_position_if_featured
    return if position.present? || featured == false

    errors.add(:base, "Must set position if featured.")
  end
end
