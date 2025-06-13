module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :order_items, [Types::OrderItemType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :total_price, Float, null: false
  end
end 