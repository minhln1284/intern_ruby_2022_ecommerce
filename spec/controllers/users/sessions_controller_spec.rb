require "rails_helper"
require "devise"

RSpec.describe Users::SessionsController, type: :controller do
  let(:user) {
    FactoryBot.create(:user)
  }

  controller do
    def after_sign_in_path_for(resource)
        super resource
    end
  end

  describe "After sigin-in" do
    it "redirects to the /jobs page" do
        controller.after_sign_in_path_for(user).should == root_path
    end
  end
end
