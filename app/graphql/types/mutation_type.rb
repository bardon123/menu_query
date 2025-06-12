# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_modifier, mutation: Mutations::CreateModifier
    field :create_modifier_group, mutation: Mutations::CreateModifierGroup
    field :create_item, mutation: Mutations::CreateItem
    field :create_menu, mutation: Mutations::CreateMenu
    field :create_section, mutation: Mutations::CreateSection
    field :register_user, mutation: Mutations::RegisterUser
    field :create_order, mutation: Mutations::CreateOrder
  end
end
