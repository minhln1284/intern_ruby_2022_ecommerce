require "rails_helper"
require "devise"

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  let(:current_user) {
    FactoryBot.create(:user, role: "admin")
  }

  describe "google_oauth2" do
    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
        provider: :google,
        uid: "12345",
        info: {
          name: "Joe",
        },
      })
      User.stub(:from_omniauth).and_return(current_user)
    end

    it "set current_user" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      post :google_oauth2
      expect(current_user).not_to be_nil
    end
  end

  describe "google_oauth2" do
    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
        provider: :google,
        uid: "12345",
        info: {
          name: "Joe",
        },
      })
      User.stub(:from_omniauth).and_return(User.new)
    end

    it "sign_in failed" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @request.env["omniauth.auth"] = OmniAuth::AuthHash.new({
        provider: :google,
        uid: "12345",
        info: {
          name: "Joe",
        },
      })
      post :google_oauth2
      expect(response).to redirect_to new_user_registration_path
    end
  end
end

# let(:current_user) { FactoryGirl.create(:user) }

# before do
#   OmniAuth.config.test_mode = true
#   OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
#     provider: :facebook,
#     uid:'12345',
#     info: {
#       name: "Joe"
#     }
#   })
#   User.stub(:from_omniauth).and_return(current_user)
# end
