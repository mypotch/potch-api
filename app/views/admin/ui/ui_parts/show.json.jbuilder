json.item do
  json.(@ui_part, :id, :pid, :name, :desc, :devices, :units, :category_id, :demo_code, :usage, :permission)
  json.part_versions @ui_part.ui_part_versions do |part_version|
    json.(part_version, :id, :ui_part_id, :desc, :px_hash, :rem_hash, :created_time)
    json.px_files part_version.px_files do |part_version_file|
      json.(part_version_file, :id, :name, :fid)
    end
    json.rem_files part_version.rem_files do |part_version_file|
      json.(part_version_file, :id, :name, :fid)
    end
    json.src_files part_version.src_files do |part_version_file|
      json.(part_version_file, :id, :name, :fid, :url)
    end
  end
end