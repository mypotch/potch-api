class View < ApplicationRecord
  belongs_to :author, polymorphic: true, optional: true
  belongs_to :viewable, polymorphic: true, counter_cache: true
end
