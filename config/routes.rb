Spree::Core::Engine.add_routes do

  namespace :admin do
    # Using :only here so it doesn't redraw those routes
    resources :orders, :only => [] do
      resources :payments, :only => [] do
        member do
          get 'cash_on_delivery_refund'
          post 'cash_on_delivery_refund'
        end
      end
    end
  end
  get "cash_on_delivery/:order_number/payment/:payment_method/success/:order_code", to: "cash_on_delivery#success", as: :cash_on_delivery_success
  get "cash_on_delivery/:order_number/payment/:payment_method/cancel/:order_code", to: "cash_on_delivery#cancel", as: :cash_on_delivery_cancel
  get "cash_on_delivery/:order_number/payment/:payment_method/failure/:order_code", to: "cash_on_delivery#failure", as: :cash_on_delivery_failure
  get "cash_on_delivery/:order_number/payment/:payment_method/pending/:order_code", to: "cash_on_delivery#pending", as: :cash_on_delivery_pending
  get "cash_on_delivery/:order_number/payment/:payment_method/error/:order_code", to: "cash_on_delivery#error", as: :cash_on_delivery_error
end