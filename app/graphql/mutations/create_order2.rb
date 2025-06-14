module Mutations
  class CreateOrder2 < BaseMutation
    class OrderItemInput < Types::BaseInputObject
      argument :item_id, ID, required: true
      argument :quantity, Integer, required: true
      argument :modifier_ids, [ID], required: false
    end

    argument :items, [OrderItemInput], required: true
    argument :promo_code, String, required: false

    field :order, Types::OrderType, null: true
    field :errors, [String], null: false
    field :promo_code, Types::PromoCodeType, null: true

    def resolve(items:, promo_code: nil)
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
        item_total = item.price * item_input[:quantity]

        if item_input[:modifier_ids].present?
          item_input[:modifier_ids].each do |mod_id|
            modifier = Modifier.find(mod_id)
            order_item.modifiers << modifier
            item_total += (modifier.item.price * item_input[:quantity]) if modifier.item&.price
          end
        end

        total_price += item_total
      end

      # Promo code logic
      discount = 0
      if promo_code.present?
        promo = PromoCode.find_by(code: promo_code)
        if promo&.valid_for_use?
          if promo.discount_type == "percent"
            discount = total_price * (promo.discount_value / 100.0)
          elsif promo.discount_type == "amount"
            discount = promo.discount_value
          end
          # Ensure discount does not exceed total
          discount = [discount, total_price].min
          # Increment usage
          promo.increment!(:times_used)
        else
          return { order: nil, errors: ["Invalid or expired promo code"] }
        end
      end

      order.total_price = total_price - discount
      order.status = "pending"
      order.promo_code = promo if promo.present?

      if order.save
        { order: order, errors: [] }
      else
        { order: nil, errors: order.errors.full_messages }
      end
    end
  end
end 