class UploaderController < ApplicationController
  def image
    blob = ActiveStorage::Blob.create_after_upload!(
        io: params[:file],
        filename: params[:file].original_filename,
        content_type: params[:file].content_type
    )
    # 本地存储
    if ActiveStorage::Blob.service.send(:service_name) === 'Disk'
      render json: { link: url_for(blob), signed_id: blob.signed_id }, status: 200
    else # Aliyun
      render json: { link: blob.service_url, signed_id: blob.signed_id }, status: 200
    end

  end
end
