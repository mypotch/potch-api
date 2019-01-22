class Vote < ApplicationRecord
  belongs_to :author, polymorphic: true
  belongs_to :voteable, polymorphic: true

  private

  def before_create
    self.voteable.counter.increment!(:comments_count)
  end

  def before_destroy
    self.voteable.counter.decrement!(:comments_count)
  end
end
