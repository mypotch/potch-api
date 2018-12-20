module UiPartVersionForm
  class Create < Reform::Form
    model :ui_part_version

    property :ui_part_id

    property :px_hash
    property :rem_hash

    collection :ui_part_version_files, populate_if_empty: UiPartVersionFile, form: UiPartVersionFileForm::Create

    validates :ui_part_id, presence: true
  end
end