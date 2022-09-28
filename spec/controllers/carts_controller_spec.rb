require "rails_helper"

RSpec.describe CartsController, type: :controller do
  let(:admin) {
    FactoryBot.create(:user, role: "admin")
  }

  let(:product) {
    FactoryBot.create(:product)
  }

  before { sign_in admin }

  describe "POST carts" do
    it "add successfully" do
      post :create, params: { id: product.id, quantily: 2 }
      expect(response).to redirect_to root_path
    end

    it "invalid product" do
      post :create, params: { id: "", quantily: 2 }
      expect(response).to redirect_to carts_path admin.id
    end

    it "invalid quantily" do
      post :create, params: { id: product.id, quantily: 10000 }
      expect(flash[:danger]).to eq I18n.t("carts.create.over_than_stock")
    end
  end

  describe "PATCH cart" do
    before do
      patch :update, params: {
                 id: product.id,
               }
    end

    it "update cart" do
      expect(response).to redirect_to cart_path(id: 2)
    end
  end
end
