class View < ApplicationRecord
  belongs_to :author, polymorphic: true
  belongs_to :viewable, polymorphic: true,
             after_add: Proc.new { |view, viewable| viewable.counter.increment!(:comments_count) },
             after_remove: Proc.new { |view, viewable| viewable.counter.decrement!(:comments_count) }
end
