class Admin::OrdersController < Admin::BaseController
  authorize_resource

  before_action :find_order, only: %i(edit update)


  def index
    @search = Order.this_month.without_deleted.newest.ransack(params[:q])
    @pagy, @orders = pagy @search.result

    # authorize! :read, @orders
  end

  def edit
    @order_details = @order.order_details
  end

  def update
    if @order.update(order_params)
      redirect_to admin_orders_path
    else
      flash[:danger] = t "flashes.update_failed"
      render :edit
    end
  end

  private

  def find_order
    @order = Order.find_by id: params[:id]
    return if @order

    flash[:danger] = t "flashes.alert_not_found"
    redirect_to admin_orders_path
  end

  def order_params
    params.require(:order).permit(:user_id, :amount, :status)
  end
end
