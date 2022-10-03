class Admin::BaseController < ApplicationController
  layout "layouts/application_admin"

  before_action :authenticate_user!, :logged_in_admin

  check_authorization unless: :devise_controller?

  skip_authorization_check only: :xlsx

  private
  def logged_in_admin
    return if current_user.admin? || current_user.manager?

    flash[:danger] = t("carts.show.please_login_admin")
    redirect_to root_path
  end
end
