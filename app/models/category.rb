class Category < ApplicationRecord
  include Footprintable
  has_footprints(except: [:updated_at, :created_at])

  has_one_attached :icon

  has_ancestry
  acts_as_list scope: [:category, :ancestry]

  has_and_belongs_to_many :posts

  enum category: { category_money: 0,  category_ui: 1 }
  ransacker :category, formatter: proc { |v| categories[v] }

  validates :category, inclusion: {in: Category.categories.keys}

  def name_with_parents
    self.ancestors.pluck(:name).push(self.name).join('/')
  end

  # subtree 包含自身和所有子孙
  def subtree_posts
    Post.joins(:categories).merge(subtree)
  end
end
