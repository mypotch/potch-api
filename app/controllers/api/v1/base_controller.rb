class Api::V1::BaseController < ApplicationController
  around_action :set_thread_current_user

  private

  def set_thread_current_user
    # Current.user = current_user
    Current.remote_ip = request.remote_ip
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    Current.user = nil
  end
end
