class Product < ApplicationRecord
  belongs_to :store

  validates_presence_of :amount, :category
end
