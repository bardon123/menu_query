class ModifierGroup < ApplicationRecord
  has_many :item_modifier_groups
  has_many :items, through: :item_modifier_groups
  has_many :modifiers
  validates :identifier, presence: true, uniqueness: true
  validates :label, presence: true
  validates :selection_required_min, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :selection_required_max, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
