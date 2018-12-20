class CreateUiParts < ActiveRecord::Migration[5.2]
  def change
    create_table :ui_parts do |t|
      t.references :category, foreign_key: true
      t.references :author, polymorphic: true
      t.string :pid
      t.string :name
      t.string :desc
      t.string :devices
      t.string :units
      t.text :usage
      t.text :demo_code

      t.integer :ui_part_versions_count, default: 0

      t.integer :permission, default: 0

      t.timestamps
    end
    add_index :ui_parts, :pid
  end
end
