class Vote < ApplicationRecord
  belongs_to :author, polymorphic: true
  belongs_to :voteable, polymorphic: true,
             after_add: Proc.new { |vote, voteable| voteable.counter.increment!(:comments_count) },
             after_remove: Proc.new { |vote, voteable| voteable.counter.decrement!(:comments_count) }
end
