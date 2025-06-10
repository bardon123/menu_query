class Modifier < ApplicationRecord
  belongs_to :item
  belongs_to :modifier_group
  
  validates :label, presence: true
end
