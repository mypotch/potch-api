module UiPartVersionFileForm
  class Create < Reform::Form
    model :ui_part_version_file

    property :name
    property :file
    property :category

  end
end