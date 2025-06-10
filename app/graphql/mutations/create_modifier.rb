# frozen_string_literal: true

module Mutations
  class CreateModifier < BaseMutation
    argument :modifier_group_id, ID, required: true
    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :price, Float, required: true

    type Types::ModifierType
    
  end
end
