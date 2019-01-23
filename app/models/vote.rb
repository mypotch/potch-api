class Vote < ApplicationRecord
  belongs_to :author, polymorphic: true
  belongs_to :voteable, polymorphic: true, counter_cache: true
end
