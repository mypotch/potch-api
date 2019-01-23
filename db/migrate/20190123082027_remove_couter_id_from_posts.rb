class RemoveCouterIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :posts, :counter, foreign_key: true
  end
end
