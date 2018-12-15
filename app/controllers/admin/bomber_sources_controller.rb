class Admin::BomberSourcesController < Admin::BaseController
  before_action :transfer_to_json, only: [:create, :update]
  def create
    super
  end

  private

  def transfer_to_json
    params[:headers] = params[:headers].present? ? JSON.parse(params[:headers]) : {}
    params[:params] = params[:params].present? ? JSON.parse(params[:params]) : {}
    params[:data] = params[:data].present? ? JSON.parse(params[:data]) : {}
    params[:result] = params[:result].present? ? JSON.parse(params[:result]) : {}
  end
end
