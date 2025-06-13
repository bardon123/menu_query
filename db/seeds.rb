# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data in the correct order to avoid foreign key violations
MenuSection.destroy_all
SectionItem.destroy_all
ItemModifierGroup.destroy_all
Modifier.destroy_all
ModifierGroup.destroy_all
Item.destroy_all
Section.destroy_all
Menu.destroy_all

# Create a menu
menu = Menu.create!(
  identifier: 'main_menu',
  label: 'Main Menu',
  state: 'published',
  start_date: Date.today,
  end_date: Date.today + 30
)

# Create sections
section1 = Section.create!(identifier: 'starters', label: 'Starters', description: 'Tasty starters')
section2 = Section.create!(identifier: 'mains', label: 'Mains', description: 'Main courses')

# Attach sections to menu
MenuSection.create!(menu: menu, section: section1, display_order: 1)
MenuSection.create!(menu: menu, section: section2, display_order: 2)

# Non-configurable items for section 1
item1 = Item.create!(item_type: 'Product', identifier: 'spring_rolls', label: 'Spring Rolls', description: 'Crispy rolls', price: 5.0)
item2 = Item.create!(item_type: 'Product', identifier: 'dumplings', label: 'Dumplings', description: 'Steamed dumplings', price: 6.0)
SectionItem.create!(section: section1, item: item1, display_order: 1)
SectionItem.create!(section: section1, item: item2, display_order: 2)

# Configurable items for section 2
item3 = Item.create!(item_type: 'Product', identifier: 'pizza', label: 'Pizza', description: 'Cheesy pizza', price: 12.0)
item4 = Item.create!(item_type: 'Product', identifier: 'burger', label: 'Burger', description: 'Juicy burger', price: 10.0)
SectionItem.create!(section: section2, item: item3, display_order: 1)
SectionItem.create!(section: section2, item: item4, display_order: 2)

# Modifier groups
sauces = ModifierGroup.create!(identifier: 'sauces', label: 'Sauces', selection_required_min: 0, selection_required_max: 2)
toppings = ModifierGroup.create!(identifier: 'toppings', label: 'Toppings', selection_required_min: 0, selection_required_max: 3)

# Attach modifier groups to items
ItemModifierGroup.create!(item: item3, modifier_group: sauces)
ItemModifierGroup.create!(item: item3, modifier_group: toppings)
ItemModifierGroup.create!(item: item4, modifier_group: toppings)
ItemModifierGroup.create!(item: item4, modifier_group: sauces)

# Modifiers (must be Components)
cheese = Item.create!(item_type: 'Component', identifier: 'cheese', label: 'Cheese', description: 'Extra cheese', price: 1.0)
lettuce = Item.create!(item_type: 'Component', identifier: 'lettuce', label: 'Lettuce', description: 'Fresh lettuce', price: 0.5)
ketchup = Item.create!(item_type: 'Component', identifier: 'ketchup', label: 'Ketchup', description: 'Tomato ketchup', price: 0.3)

Modifier.create!(item: cheese, modifier_group: toppings, label: 'Extra Cheese')
Modifier.create!(item: lettuce, modifier_group: toppings, label: 'Lettuce')
Modifier.create!(item: ketchup, modifier_group: sauces, label: 'Ketchup')
