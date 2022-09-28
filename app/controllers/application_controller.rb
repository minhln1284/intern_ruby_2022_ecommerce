class ApplicationController < ActionController::Base
  include Pagy::Backend
  include CartsHelper
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :current_cart, :load_product_in_cart, :search_bar

  rescue_from CanCan::AccessDenied do |_exception|
    flash[:danger] = t("unauthorized")
    redirect_to root_path
  end

  private

  def search_bar
    @q = Product.ransack(params[:q])
    @pagy, @products = pagy(@q.result)
  end

  def after_sign_in_path_for resource
    if current_user.admin?
      (stored_location_for(resource) || admin_root_path)
    else
      (stored_location_for(resource) || root_path)
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
