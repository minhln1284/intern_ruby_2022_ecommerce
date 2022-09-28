require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do
  let(:admin) {
    FactoryBot.create(:user, role: "admin")
  }
  before { sign_in admin }

  describe "GET /user" do
    it "render show page" do
      get :show, params: { id: admin.id }
      expect(response).to render_template("show")
    end

    it "no user found" do
      get :show, params: { id: "" }
      expect(flash[:danger]).to eq I18n.t("flashes.alert_not_found")
    end
  end
end
