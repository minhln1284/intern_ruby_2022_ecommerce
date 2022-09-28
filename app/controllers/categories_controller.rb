class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(id: params[:id])
    @pagy, @products = pagy @category.products if @category.present?
  end
end
