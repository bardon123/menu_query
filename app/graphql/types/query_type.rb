# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :menus, [Types::MenuType], null: false
    def menus
      Menu.all
    end

    field :menu, Types::MenuType, null: true do
      argument :id, ID, required: true
    end
    def menu(id:)
      Menu.find_by(id: id)
    end

    field :sections, [Types::SectionType], null: false
    def sections
      Section.all
    end

    field :section, Types::SectionType, null: true do
      argument :id, ID, required: true
    end
    def section(id:)
      Section.find_by(id: id)
    end

    field :items, [Types::ItemType], null: false
    def items
      Item.all
    end

    field :item, Types::ItemType, null: true do
      argument :id, ID, required: true
    end
    def item(id:)
      Item.find_by(id: id)
    end

    field :modifier_groups, [Types::ModifierGroupType], null: false
    def modifier_groups
      ModifierGroup.all
    end

    field :modifier_group, Types::ModifierGroupType, null: true do
      argument :id, ID, required: true
    end
    def modifier_group(id:)
      ModifierGroup.find_by(id: id)
    end

    field :modifiers, [Types::ModifierType], null: false
    def modifiers
      Modifier.all
    end

    field :modifier, Types::ModifierType, null: true do
      argument :id, ID, required: true
    end
    def modifier(id:)
      Modifier.find_by(id: id)
    end
  end
end
