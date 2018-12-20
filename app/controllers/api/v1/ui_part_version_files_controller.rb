class Api::V1::UiPartVersionFilesController < Api::V1::BaseController
  def show
    @part_version_file = UiPartVersionFile.find_by(fid: params[:fid])
    expires_in 10.years, public: true
  end
end
