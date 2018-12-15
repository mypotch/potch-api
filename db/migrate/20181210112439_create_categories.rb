class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :enabled, default: true
      t.boolean :recommended, default: false
      t.integer :category, limit: 1, default: 0
      t.integer :position

      t.timestamps
    end
  end
end
