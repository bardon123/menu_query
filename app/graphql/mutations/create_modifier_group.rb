# frozen_string_literal: true

module Mutations
  class CreateModifierGroup < BaseMutation
   argument :item_id, ID, required: true
   argument :identifier, String, required: true
   argument :label, String, required: true
   argument :selection_required_min, Integer, required: true
   argument :selection_required_max, Integer, required: true

   type Types::ModifierGroupType
  end
end
