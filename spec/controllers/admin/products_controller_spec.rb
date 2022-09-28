require "rails_helper"

RSpec.describe Admin::ProductsController, type: :controller do
  let(:admin) {
    FactoryBot.create(:user, role: "admin")
  }

  let(:product) {
    FactoryBot.create(:product)
  }

  before { sign_in admin }

  describe "GET admin/products" do
    it "render index page" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET admin/product" do
    before { get :show, params: { id: product.id } }
    it "render show page" do
      expect(response).to render_template("show")
    end
  end

  describe "GET admin/products/new" do
    it "render new page" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "PATCH admin/products" do
    before do
      patch :update, params: {
                id: product.id,
                product: {
                  name: product.name,
                  price: product.price,
                  quantity_in_stock: product.quantity_in_stock,
                  description: product.description,
                },
               }
    end

    it "update category" do
      expect(response).to redirect_to admin_product_path(product)
    end
  end

  describe "PATCH admin/products" do
    before do
      patch :update, params: {
        id: product.id,
        product: {
          name: product.name,
          price: "",
          quantity_in_stock: product.quantity_in_stock,
          description: product.description,
        },
       }
    end

    it "update category" do
      expect(flash[:danger]).to eq I18n.t("flashes.update_failed")
    end
  end

  describe "DELETE admin/products" do
    before do
      delete :destroy, params: {
        id: product.id,
       }
    end

    it "destroy category" do
      expect(response).to redirect_to admin_products_path
    end
  end

  describe "DELETE admin/products" do
    before do
      delete :destroy, params: {
        id: 0,
       }
    end

    it "destroy category" do
      expect(flash[:danger]).to eq I18n.t("flashes.alert_not_found")
    end
  end
end
