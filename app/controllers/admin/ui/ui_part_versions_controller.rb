class Admin::Ui::UiPartVersionsController < Admin::BaseController
  include ReverseProxy::Controller
  def create
    part = UiPart.find_by(id: params[:ui_part_id])
    render json: {msg: 'part can not find'}, status: 422 and return if part.blank?

    reverse_proxy $env['node_host'], path: '/api/uploader/co_files' do |config|
      config.on_response do |code, response|
        if code == 200
          # compiled_body = response.body
          published_body = HTTParty.post("#{$env['node_host']}/api/uploader/co_publish", body: {index: params[:index]}).body

          hash = UiPartVersion.extract_published_body(ActiveSupport::JSON.decode(published_body)) rescue nil
          if hash
            if UiPartVersion.find_by(rem_hash: hash[:rem_hash], px_hash: hash[:px_hash]).present?
              render json: {msg: 'the same part version has exist on server'}, status: 422 and return
            end
            params.merge!(hash)
            super({auto_render_success: false, auto_render_error: false}) and return
          else
            response.body = published_body
          end
          # response.body = published_body
        end
      end
    end
  end
end
