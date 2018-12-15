class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :author, polymorphic: true
      t.references :commentable, polymorphic: true
      t.string :content
      t.string :ip, index: true
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
