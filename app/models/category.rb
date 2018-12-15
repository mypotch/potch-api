class Category < ApplicationRecord
  include Footprintable
  has_footprints(except: [:updated_at, :created_at])

  has_ancestry
  acts_as_list scope: [:category, :ancestry]

  has_and_belongs_to_many :posts

  enum category: { category_money: 0 }
  ransacker :category, formatter: proc { |v| categories[v] }

  validates :category, inclusion: {in: ["category_money"]}

  def name_with_parents
    self.ancestors.pluck(:name).push(self.name).join('/')
  end
end
