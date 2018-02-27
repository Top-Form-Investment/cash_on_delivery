Deface::Override.new(
  virtual_path: 'spree/admin/payment_methods/_form',
  name: 'Use custom form partial for CashOnDelivery payment method',
  surround: '[data-hook="admin_payment_method_form_fields"]',
  text: '<% if @object.kind_of?(Spree::Gateway::CashOnDelivery) %>
           <%= render "cash_on_delivery", f: f %>
         <% else %>
           <%= render_original %>
         <% end %>'
)