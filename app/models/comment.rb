class Comment < ApplicationRecord
  belongs_to :author, polymorphic: true
  belongs_to :commentable, polymorphic: true

  before_create :before_create
  before_destroy :before_destroy

  private

  def before_create
    self.commentable.counter.increment!(:comments_count)
  end

  def before_destroy
    self.commentable.counter.decrement!(:comments_count)
  end
end
