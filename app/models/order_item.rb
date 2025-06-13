class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  has_many :order_item_modifiers
  has_many :modifiers, through: :order_item_modifiers

  validates :order, presence: true
  validates :item, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
