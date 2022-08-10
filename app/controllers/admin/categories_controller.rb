class Admin::CategoriesController < Admin::BaseController
  before_action :find_category, only: %i(edit show update destroy)
  before_action :get_all, only: %i(new edit)

  def index
    @pagy, @categories = pagy(Category.all.newest, item: Settings.category.item)
  end

  def show
    @parent = Category.find_by id: @category.parent_id
    @parent = @parent.nil? ? t("admin.category.none") : @parent.name
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = t "flashes.update_success"
      redirect_to admin_category_path(@category)
    else
      flash[:danger] = t "flashes.update_failed"
      render :edit
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = t "flashes.create_success"
      redirect_to admin_categories_path
    else
      flash[:danger] = t "flashes.create_failed"
      render :new
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "flashes.delete_success"
    else
      flash[:danger] = t "flashes.delete_failed"
    end
    redirect_to admin_categories_path
  end

  private
  def find_category
    @category = Category.find_by id: params[:id]
    return if @category

    flash[:danger] = t "flashes.alert_not_found"
    redirect_to admin_categories_path
  end

  def category_params
    params.require(:category).permit(:name, :parent_id, :parent_path)
  end

  def get_all
    @categories = Category.all
  end
end
