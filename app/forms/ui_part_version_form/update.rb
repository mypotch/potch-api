module UiPartVersionForm
  class Update < Reform::Form
    model :ui_part_version

    property :desc

    validates :desc, presence: true
  end
end