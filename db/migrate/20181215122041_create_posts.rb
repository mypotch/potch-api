class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :counter, foreign_key: true

      t.references :author, polymorphic: true
      t.string :pid
      t.string :title
      t.text :content
      t.boolean :enabled, default: true

      t.timestamps
    end
    add_index :posts, :pid, unique: true
  end
end
