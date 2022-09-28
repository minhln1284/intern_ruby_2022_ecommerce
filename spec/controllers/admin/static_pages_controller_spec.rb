require "rails_helper"

RSpec.describe Admin::StaticPagesController, type: :controller do
  let(:admin) {
    FactoryBot.create(:user, role: "admin")
  }
  before { sign_in admin }

  describe "GET admin/" do
    it "render index page" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
