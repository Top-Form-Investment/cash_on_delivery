Spree::BaseHelper.class_eval do

	def redirect_url(type, order_code, payment_method_id)
		url = case type
		when 'success'
		 cash_on_delivery_success_path(current_order.number, payment_method_id, order_code)
		when 'cancel'
		 cash_on_delivery_cancel_path(current_order.number, payment_method_id, order_code)
		when 'failure'
		 cash_on_delivery_failure_path(current_order.number, payment_method_id, order_code)
		when 'pending'
		 cash_on_delivery_pending_path(current_order.number, payment_method_id, order_code)
		when 'error'
			cash_on_delivery_error_path(current_order.number, payment_method_id, order_code)
		else
			''
		end
		request.base_url+url
	end

end