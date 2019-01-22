class View < ApplicationRecord
  belongs_to :author, polymorphic: true
  belongs_to :viewable, polymorphic: true

  private

  def before_create
    self.viewable.counter.increment!(:comments_count)
  end

  def before_destroy
    self.viewable.counter.decrement!(:comments_count)
  end
end
