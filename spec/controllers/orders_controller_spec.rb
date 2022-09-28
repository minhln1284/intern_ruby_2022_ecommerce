require "rails_helper"

RSpec.describe OrdersController, type: :controller do
  let(:admin) {
    FactoryBot.create(:user, role: "admin")
  }

  let(:order) {
    FactoryBot.create(:order, user: admin)
  }

  before { sign_in admin }

  describe "GET orders" do
    it "render index page" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET order" do
    before { get :show, params: { id: order.id } }
    it "render show page" do
      expect(response).to render_template("show")
    end
  end

  describe "GET orders/new" do
    before { get :new }
    it "render new order page" do
      expect(response).to render_template("new")
    end
  end

  describe "POST orders/new" do
    before do
      post :create, xhr: true, params: {
        order: {amount: order.amount, status: order.status,
                user: admin},
      }
    end

    it "should redirect back to root path" do
      expect(response).to redirect_to root_path
    end
  end

end
