module Mutations
  class CreateOrder2 < BaseMutation
    class OrderItemInput < Types::BaseInputObject
      argument :item_id, ID, required: true
      argument :quantity, Integer, required: true
      argument :modifier_ids, [ID], required: false
    end

    argument :items, [OrderItemInput], required: true

    field :order, Types::OrderType, null: true
    field :errors, [String], null: false

    def resolve(items:)
      user = context[:current_user]
      return { order: nil, errors: ["Authentication required"] } unless user

      order = user.orders.build
      total_price = 0

      items.each do |item_input|
        item = Item.find(item_input[:item_id])
        order_item = order.order_items.build(
          item_id: item.id,
          quantity: item_input[:quantity],
          price: item.price
        )
        total_price += item.price * item_input[:quantity]
        # Optionally, add modifier prices to total_price here if needed
      end

      order.total_price = total_price
      order.status = "pending" # or whatever default status you use

      if order.save
        { order: order, errors: [] }
      else
        { order: nil, errors: order.errors.full_messages }
      end
    end
  end
end 