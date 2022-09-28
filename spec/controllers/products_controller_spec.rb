require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  let(:admin) {
    FactoryBot.create(:user, role: "admin")
  }

  let(:product) {
    FactoryBot.create(:product)
  }

  before { sign_in admin }

  describe "GET products" do
    it "render index page" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET product" do
    context "Successfully" do
      before { get :show, params: { id: product.id } }
      it "render show product page" do
        expect(response).to render_template("show")
      end
    end

    context "Product not found" do
      before { get :show, params: { id: 100000 } }
      it "Redirect back to root with flash" do
        expect(flash[:danger]).to eq I18n.t("static_pages.product_not_found")
      end
    end
  end
end
