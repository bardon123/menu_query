class Menu < ApplicationRecord
  has_many :menu_sections
  has_many :sections, through: :menu_sections
  validates :identifier, presence: true, uniqueness: true
  validates :label, presence: true
  validates :state, presence: true, inclusion: { in: %w[draft published archived] }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
