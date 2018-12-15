class Category < ApplicationRecord
  include Footprintable
  has_footprints(except: [:updated_at, :created_at])

  has_ancestry
  acts_as_list scope: [:category, :ancestry]

  enum category: { category_money: 0 }
  ransacker :category, formatter: proc { |v| categories[v] }
end
