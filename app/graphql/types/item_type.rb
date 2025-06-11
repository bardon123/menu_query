# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false

    field :identifier, String
    field :label, String
    field :description, String
    field :price, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :modifiers, [ Types::ModifierType ], null: true

    field :modifier_groups, [ Types::ModifierGroupType ], null: true
  end
end
