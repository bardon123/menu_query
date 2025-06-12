module Mutations
  class CreateOrder < BaseMutation
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
      items.each do |item_input|
        order_item = order.order_items.build(
          item_id: item_input[:item_id],
          quantity: item_input[:quantity],
          price: Item.find(item_input[:item_id]).price
        )
        if item_input[:modifier_ids]
          order_item.modifier_ids = item_input[:modifier_ids]
        end
      end
      if order.save
        { order: order, errors: [] }
      else
        { order: nil, errors: order.errors.full_messages }
      end
    end
  end
end 