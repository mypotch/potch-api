module BomberSourceForm
  class Update < Reform::Form
    model :bomber_source

    property :title
    property :url
    property :headers
    property :params
    property :data
    property :result

    validates :title, :url, presence: true
  end
end