class Counter < ApplicationRecord
  belongs_to :countable, polymorphic: true
end
