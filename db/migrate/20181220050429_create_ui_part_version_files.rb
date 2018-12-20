class CreateUiPartVersionFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :ui_part_version_files do |t|
      t.references :ui_part_version, foreign_key: true
      t.string :fid
      t.string :name
      t.string :file
      t.integer :category, default: 0

      t.timestamps
    end
    add_index :ui_part_version_files, :fid
  end
end
