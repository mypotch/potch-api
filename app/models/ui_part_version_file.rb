class UiPartVersionFile < ApplicationRecord
  belongs_to :ui_part_version, optional: true

  enum category: { category_src: 0, category_px: 1, category_rem: 2 }
  ransacker :category, formatter: proc { |v| categories[v] }

  before_create :generate_fid

  def url
    "#{$env['oss_host']}/#{self.file}"
  end

  private

  def generate_fid
    self.fid = "F#{generate_id}"
    generate_fid if self.class.find_by(fid: self.fid).present?
  end
end
