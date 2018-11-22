module BomberSourceForm
  class Update < Reform::Form
    model :bomber_source

    property :title
    property :url
    property :headers
    property :params
    property :data
    property :result

  end
end