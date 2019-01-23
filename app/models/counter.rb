class Counter < ApplicationRecord
  belongs_to :countable, polymorphic: true
  has_many :views, :as => :viewable
  has_many :votes, :as => :voteable
  has_many :comments, :as => :commentable

  #  class method
  def add_views_count
    self.views.day_range_column(:created_at).find_or_create_by(ip: Current.remote_ip) do |view|
      view.author = Current.user
    end
  end

  def add_votes_count
    self.voteable.day_range_column(:created_at).find_or_create_by(ip: Current.remote_ip) do |vote|
      vote.author = Current.user
    end
  end

  def add_comments_count comment
  end
end
