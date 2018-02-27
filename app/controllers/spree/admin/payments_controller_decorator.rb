Spree::Admin::PaymentsController.class_eval do
  def cash_on_delivery_refund
    if request.get?
      if @payment.source.state == 'refunded'
        flash[:error] = Spree.t(:already_refunded, :scope => 'cash_on_delivery')
        redirect_to admin_order_payment_path(@order, @payment)
      end
    elsif request.post?
      response = @payment.payment_method.refund(@payment, params[:refund_amount])
      if response.success?
        flash[:success] = Spree.t(:refund_successful, :scope => 'cash_on_delivery')
        redirect_to admin_order_payments_path(@order)
      else
        flash.now[:error] = Spree.t(:refund_unsuccessful, :scope => 'cash_on_delivery') + " (#{response.errors.first.long_message})"
        render
      end
    end
  end
end