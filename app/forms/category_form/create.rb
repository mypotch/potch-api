module CategoryForm
  class Create < Reform::Form
    model :category

    property :name
    property :parent_id
    property :enabled
    property :recommended
    property :category
    property :icon, virtual: true

    validates :name, presence: true, length: { maximum: 40 }
    validates :category, presence: true

    def save
      is_success = super
      self.model.update(icon: self.icon) if is_success && self.icon.present?
      is_success
    end
  end
end