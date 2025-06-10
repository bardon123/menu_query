# frozen_string_literal: true

module Mutations
  class CreateSection < BaseMutation
   argument :menu_id, ID, required: true
   argument :identifier, String, required: true
   argument :label, String, required: true
   argument :description, String, required: false

   type Types::SectionType

   def resolve(menu_id:, identifier:, label:, description:)
    Section.create!(
      menu_id: menu_id,
      identifier: identifier,
      label: label,
      description: description
    )
   end
  end
end
