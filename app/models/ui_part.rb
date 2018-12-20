class UiPart < ApplicationRecord
  include MultiStatusable
  has_multi_status :devices, ['pc', 'wap']
  has_multi_status :units, ['px', 'rem']

  validates :devices, :units, presence: true
  validates :desc, length: {maximum: 255} # 最多255个字符

  enum permission: { permission_private: 0, permission_public: 1 }
  ransacker :permission, formatter: proc { |v| permissions[v] }

  belongs_to :category
  belongs_to :author, polymorphic: true
  has_many :ui_part_versions, -> { order(id: :desc) }
  has_many :ui_part_version_files, through: :ui_part_versions

  before_create :generate_pid

  private

  def generate_pid
    self.pid = generate_id
    generate_pid if self.class.find_by(pid: self.pid).present?
  end
end
