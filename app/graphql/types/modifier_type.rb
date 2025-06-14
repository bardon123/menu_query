# frozen_string_literal: true

module Types
  class ModifierType < Types::BaseObject
    field :id, ID, null: false
    field :item_id, Integer, null: false
    field :modifier_group_id, Integer, null: false
    field :display_order, Integer
    field :default_quantity, Integer
    field :price_override, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :price, Float, null: false

    field :item, Types::ItemType, null: true
    field :modifier_group, Types::ModifierGroupType, null: true
    field :label, String, null: true

    def price
      object.item&.price || 0
    end
  end
end
