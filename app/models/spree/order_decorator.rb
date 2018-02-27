Spree::Order.class_eval do
  before_save :change_sp_state, if: ->(order) { order.state == 'complete' && order.shipments.present?}
   # Return available payment methods
  def available_payment_methods
    @available_payment_methods ||= (Spree::PaymentMethod.available(:front_end) + Spree::PaymentMethod.available(:both)).uniq
  end

  # Update payment information on order complete
  # Associates the specified user with the order.
    def change_sp_state
      self.shipment_state = 'ready'
      self.payment_state = 'cod'
    end

end