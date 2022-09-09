require 'rails_helper'
include SessionsHelper

RSpec.describe Admin::OrdersController, type: :controller do
  let(:admin){
    FactoryBot.create(:user, role: "Admin")
  }

  let(:order){
    FactoryBot.create :order, user: admin
  }

  before {sign_in admin}

  describe "GET admin/orders" do
    it "render index page" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET edit" do
    context "Successfully" do
      before{get :edit, params:{id: order.id}}

      it "render edit page successfully" do
        expect(assigns(:order_details)).to eq(order.order_details)
      end
    end

    context "Order's id nil" do
      before{get :edit, params:{id: ""}}

      it "Update failed" do
        expect(flash[:danger]).to eq I18n.t("flashes.alert_not_found")
      end
    end
  end

  describe "PATCH admin/order" do
    context "when update success" do
      before do
        patch :update, params:{
          id: order.id,
          order:{user_id: order.user_id,
            amount: order.amount,
            status: order.status}
        }
      end

      it "Update successfully" do
        expect(response).to redirect_to(admin_orders_path)
      end
    end

    context "when update failed" do
      describe "Order update failed" do
        before do
          patch :update, params:{
            id: order.id,
            order:{user_id: -1,
              amount: order.amount,
              status: order.status}
          }
        end

        it "Update failed" do
          expect(flash[:danger]).to eq I18n.t("flashes.update_failed")
        end
      end
    end

    context "invalid order_id" do
      before{patch :update, params:{id: 0}}

      it "Update failed" do
        expect(flash[:danger]).to eq I18n.t("flashes.alert_not_found")
      end
    end
  end
end
