module PostForm
  class Create < Reform::Form
    model :post

    property :title
    property :author
    property :content
    property :category_ids
    # property :enabled, default: true

    validates :title, :content, :category_ids, presence: true
  end
end