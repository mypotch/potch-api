module PostForm
  class Update < Reform::Form
    model :post

    property :title
    # property :author
    property :content
    # property :enabled, default: true
    property :category_ids

    validates :title, :content, :category_ids, presence: true
  end
end