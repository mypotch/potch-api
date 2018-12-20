module UiPartForm
  class Create < Reform::Form
    model :ui_part

    property :category_id
    property :author

    property :name
    property :desc

    # property :usage
    # property :demo_code

    property :permission

    property :devices
    property :units

    # collection :part_versions, populate_if_empty: PartVersion, form: PartVersion::Create

    validates :name, :category_id, presence: true
    validates :name, :desc, length: { maximum: 255 }
  end
end