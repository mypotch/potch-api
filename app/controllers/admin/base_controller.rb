class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!, unless: :devise_controller?
  around_action :set_thread_footprint_actor

  def toggle_switch
    field = params[:field]
    br_show do |model|
      p model, field
      case model.class.columns_hash[field].type
      when :datetime
        model[field] = model[field].present? ? nil : Time.now
        model.save
      when :boolean # [true, false].include? model[field]
        model.toggle!(field)
      else
        render json: {msg: 'invalid! can not switch'}, status: 422 and return
      end
      render json: {value: model[field], msg: 'successfully'}, status: 200 and return
    end
  end

  private

  def set_thread_footprint_actor
    Footprintable::Current.actor = current_admin
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    Footprintable::Current.actor = nil
  end
end
