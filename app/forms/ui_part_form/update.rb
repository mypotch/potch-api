module UiPartForm
  class Update < Reform::Form
    model :ui_part

    property :category_id

    property :name
    property :desc

    property :permission

    property :usage
    property :demo_code

    property :devices
    property :units

    # collection :component_codes, populate_if_empty: ComponentCode, form: ComponentCode::Create

    validates :name, :category_id, :devices, :units, presence: true
    validates :name, :desc, length: { maximum: 255 }
  end
end