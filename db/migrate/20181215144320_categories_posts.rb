class CategoriesPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_posts do |t|
      t.belongs_to :category, index: true
      t.belongs_to :post, index: true
    end
  end
end
