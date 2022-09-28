require "rails_helper"

RSpec.describe Admin::XlsxController, type: :controller do
  let(:admin) {
    FactoryBot.create(:user, role: "admin")
  }
  before { sign_in admin }

  describe "GET /xlsx" do
    it "render show page" do
      get :index, format: :xlsx
      month = Date::MONTHNAMES[Date.current.last_month.month.to_i]
      expect(response.headers["Content-Disposition"]).to eq "attachment; filename=#{month}_summary.xlsx"
    end
  end
end
