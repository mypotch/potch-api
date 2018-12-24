module CommentForm
  class Create < Reform::Form
    model :comment

    property :commentable
    property :author
    property :content

    validates :commentable, :author, presence: true
    validates :content, presence: true, length: { maximum: 255 }
  end
end