module CategoryForm
  class Create < Reform::Form
    model :category

    property :name
    property :parent_id
    property :enabled
    property :recommended
    property :category

    validates :name, presence: true, length: { maximum: 40 }
    validates :category, presence: true
  end
end