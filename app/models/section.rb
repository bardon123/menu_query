class Section < ApplicationRecord
  has_many :menu_sections
  has_many :section_items
  has_many :items, through: :section_items

  validates :identifier, presence: true, uniqueness: true
  validates :label, presence: true
  validates :description, length: { maximum: 255 }
end
