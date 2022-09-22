class AdminMailer < ApplicationMailer
  helper(Admin::ApplicationHelper)

  def monthly_summary
    @greeting = t("monthly_mailer.hi")
    @orders = Order.this_month.group(:user_id).count
    @order_details = OrderDetail.this_month.group(:product_id).count
    mail to: "to@example.org", subject: t("monthly_mailer.subject")
  end
end
