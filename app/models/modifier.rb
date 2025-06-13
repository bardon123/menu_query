class Modifier < ApplicationRecord
  belongs_to :item
  belongs_to :modifier_group
  has_many :order_item_modifiers
  has_many :order_items, through: :order_item_modifiers

  validates :label, presence: true
  validate :item_must_be_component

  scope :for_components, -> { joins(:item).where(items: { item_type: "Component" }) }

  private

  def item_must_be_component
    if item && item.item_type != "Component"
      errors.add(:item, "must be a Component")
    end
  end
end
