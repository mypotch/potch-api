module CategoryForm
  class UpdatePosition < Reform::Form
    model :category

    property :position
    property :parent_id

    validates :position, presence: true
  end
end