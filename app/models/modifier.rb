class Modifier < ApplicationRecord
  belongs_to :item
  belongs_to :modifier_group
  
  validates :label, presence: true
  validate :item_must_be_component

  scope :for_components, -> { joins(:item).where(items: { item_type: 'Component' }) }

  private

  def item_must_be_component
    if item && item.item_type != 'Component'
      errors.add(:item, 'must be a Component')
    end
  end
end
