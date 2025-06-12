class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  validates :cart, presence: true
  validates :item, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
