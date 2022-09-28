require "rails_helper"

RSpec.describe Admin::CategoriesController, type: :controller do
  let(:admin) {
    FactoryBot.create(:user, role: "admin")
  }

  let(:category) {
    FactoryBot.create(:category)
  }

  before { sign_in admin }

  describe "GET admin/categories" do
    it "render index page" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET admin/category" do
    before { get :show, params: { id: category.id } }
    it "render show page" do
      expect(response).to render_template("show")
    end
  end

  describe "GET admin/categorie/new" do
    it "render new page" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "PATCH admin/categoríe" do
    before do
      patch :update, params: {
                id: category.id,
                category: {
                  name: category.name,
                  category_id: "",
                },
               }
    end

    it "update category" do
      expect(response).to redirect_to admin_category_path(category)
    end
  end

  describe "PATCH admin/categoríe" do
    before do
      patch :update, params: {
                id: "",
                category: {
                  name: category.name,
                  category_id: "",
                },
               }
    end

    it "update category" do
      expect(flash[:danger]).to eq I18n.t("flashes.alert_not_found")
    end
  end

  describe "POST admin/categories" do
    before do
      patch :create, params: {
                id: category.id,
                category: {
                  name: category.name,
                  category_id: "",
                },
               }
    end

    it "update category" do
      expect(flash[:success]).to eq I18n.t("flashes.create_success")
    end
  end
end
