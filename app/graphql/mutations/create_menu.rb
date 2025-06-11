# frozen_string_literal: true

module Mutations
  class CreateMenu < BaseMutation
    argument :label, String, required: true
    argument :state, String, required: true
    argument :start_date, GraphQL::Types::ISO8601Date, required: true
    argument :end_date, GraphQL::Types::ISO8601Date, required: true

    type Types::MenuType

    def resolve(identifier:, label:, state:, start_date:, end_date:)
      Menu.create!(
        identifier: identifier,
        label: label,
        state: state,
        start_date: start_date,
        end_date: end_date
      )
    end
  end
end
