class Product < ApplicationRecord
  belongs_to :store
  has_one_attached :image, dependent: :destroy

  validates_presence_of :category
  validate :validate_price_or_variable

  private

  # add specs for this
  def validate_price_or_variable
    return if amount.present? || variable_pricing

    errors.add(:base, "Must have amount set if pricing is not variable")
  end
end
