class ApplicationController < ActionController::Base
  include Pagy::Backend
  include SessionsHelper
  include CartsHelper
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :current_cart, :load_product_in_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def after_sign_in_path_for resource
    if current_user.Admin?
      (stored_location_for(resource) || admin_root_path)
    else
      (stored_location_for(resource) || root_path)
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t(".please_login")
    redirect_to login_path
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t("users.before_action.not_found")
    redirect_to root_path
  end
end
