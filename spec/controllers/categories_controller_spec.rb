require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  let(:category) {
    FactoryBot.create(:category)
  }

  describe "GET category" do
    before { get :show, params: { id: category.id } }
    it "render show page" do
      expect(response).to render_template("show")
    end
  end
end
