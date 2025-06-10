# frozen_string_literal: true

module Mutations
  class CreateItem < BaseMutation
    argument :section_id, ID, required: true
    argument :item_type, String, required: true
    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :description, String, required: false
    argument :price, Float, required: true
    
  end
end
