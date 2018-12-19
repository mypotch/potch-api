module PostForm
  class Create < Reform::Form
    model :post

    property :title
    property :desc
    property :author
    property :content
    property :category_ids
    # property :enabled, default: true
    property :icon, virtual: true

    validates :title, :content, :category_ids, presence: true

    def save
      is_success = super
      self.model.update(icon: self.icon) if is_success && self.icon.present?
      is_success
    end
  end
end