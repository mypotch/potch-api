class Admin::Ui::UiPartsController < Admin::BaseController
  def create
    params[:author] = current_admin
    super
  end

  def demo_code
    show do |part|
      render json: {demo_code: part.demo_code}, status: 200
    end
  end
end
