class Comment < ApplicationRecord
  belongs_to :author, polymorphic: true
  belongs_to :commentable, polymorphic: true,
             after_add: Proc.new { |comment, commentable| commentable.counter.increment!(:comments_count) },
             after_remove: Proc.new { |comment, commentable| commentable.counter.decrement!(:comments_count) }
end
