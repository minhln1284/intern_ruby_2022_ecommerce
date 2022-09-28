require "rails_helper"

RSpec.describe StaticPagesController, type: :controller do
  describe "GET root" do
    it "render root page" do
      get :home
      expect(response).to render_template("home")
    end
  end
end
