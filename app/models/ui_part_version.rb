class UiPartVersion < ApplicationRecord
  belongs_to :ui_part, counter_cache: true
  has_many :ui_part_version_files, -> { order(id: :desc) }, dependent: :destroy

  before_create :generate_vid

  def self.extract_published_body published_body
    part_version_files = []
    px_hash = published_body['src']['config']['px']['shortHash'] rescue nil
    rem_hash = published_body['src']['config']['rem']['shortHash'] rescue nil
    src_file = published_body['src']['object']['name'] rescue nil
    part_version_files.push({file: src_file, category: 'category_src', name: published_body['src']['filename']})

    published_body['dist']['objects'].each do |item|
      part_version_files.push(file: item['object']['name'], category: 'category_px', name: item['filename'].gsub(/\..+/, '')) if item['unit'] == 'px'
      part_version_files.push(file: item['object']['name'], category: 'category_rem', name: item['filename'].gsub(/\..+/, '')) if item['unit'] == 'rem'
    end
    {px_hash: px_hash, rem_hash: rem_hash, ui_part_version_files: part_version_files}
  end

  def px_files
    ui_part_version_files.category_px
  end

  def rem_files
    ui_part_version_files.category_rem
  end

  def src_files
    ui_part_version_files.category_src
  end

  private

  def generate_vid
    self.vid = "V#{generate_id}"
    generate_vid if self.class.find_by(vid: self.vid).present?
  end
end
