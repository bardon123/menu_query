module Types
  class OrderItemType < Types::BaseObject
    field :id, ID, null: false
    field :item, Types::ItemType, null: false
    field :quantity, Integer, null: false
    field :price, Float, null: false
    # field :modifiers, [Types::ModifierType], null: true
  end
end 