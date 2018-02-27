module Spree
  class Gateway::CashOnDelivery < Gateway

    preference :card_type, :array
    preference :merchant_address, :text
    preference :test_mode, :boolean

    def provider_class
      ActiveMerchant::Billing::CashOnDelivery
    end

    ## change method type
    def method_type
      'cash_on_delivery'
    end

    def source_required?
      false
    end



  end
end