class Item < ApplicationRecord
  has_many :item_modifier_groups
  has_many :modifier_groups, through: :item_modifier_groups
  has_many :section_items 
  has_many :modifiers

  validates :item_type, presence: true, inclusion: { in: %w[Product Component] }
  validates :identifier, presence: true, uniqueness: true
  validates :label, presence: true
  validates :description, length: { maximum: 255 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

