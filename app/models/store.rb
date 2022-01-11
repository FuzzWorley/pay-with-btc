class Store < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :admin, optional: true

  validates_presence_of :name, :currency
end
