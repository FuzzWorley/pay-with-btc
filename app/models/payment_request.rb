class PaymentRequest < ApplicationRecord
  belongs_to :product

  validates_presence_of :amount, :title
end
