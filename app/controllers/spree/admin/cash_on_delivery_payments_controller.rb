module Spree
  class Admin::CashOnDeliveryPaymentsController < Spree::Admin::BaseController
    before_filter :load_order

    def index
      @payments = @order.payments.includes(:payment_method).where(:spree_payment_methods => { :type => "Spree::Gateway::CashOnDelivery" })
    end

    private

    def load_order
      @order = Spree::Order.where(:number => params[:order_id]).first
    end
  end
end