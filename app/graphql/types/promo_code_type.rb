module Types
  class PromoCodeType < Types::BaseObject
    field :id, ID, null: false
    field :code, String, null: false
    field :discount_type, String, null: false
    field :discount_value, Float, null: false
    field :expires_at, GraphQL::Types::ISO8601DateTime, null: true
    field :usage_limit, Integer, null: true
    field :times_used, Integer, null: false
    field :active, Boolean, null: false
  end
end
