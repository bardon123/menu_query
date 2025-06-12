module Types
  class CreateOrderInput < Types::BaseInputObject
    argument :items, [Mutations::CreateOrder::OrderItemInput], required: true
  end
end 