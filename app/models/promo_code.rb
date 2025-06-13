class PromoCode < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :discount_type, inclusion: { in: %w[percent amount] }
  validates :discount_value, numericality: { greater_than: 0 }
  validate :not_expired
  validate :not_over_limit

  def valid_for_use?
    active && !expired? && !over_limit?
  end

  def expired?
    expires_at.present? && expires_at < Time.current
  end

  def over_limit?
    usage_limit.present? && times_used >= usage_limit
  end

  private

  def not_expired
    errors.add(:base, "Promo code expired") if expired?
  end

  def not_over_limit
    errors.add(:base, "Promo code usage limit reached") if over_limit?
  end
end
