class Post < ApplicationRecord

  belongs_to :author, polymorphic: true
  has_and_belongs_to_many :categories
  has_one :counter, :as => :countable

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  before_create :before_create

  private

  def before_create
    self.pid = generate_id
    self.counter ||= Counter.create
  end
end
