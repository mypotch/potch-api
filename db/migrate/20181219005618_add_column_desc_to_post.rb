class AddColumnDescToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :desc, :string
  end
end
