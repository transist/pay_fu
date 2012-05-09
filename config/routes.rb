Payment::Engine.routes.draw do
  match 'payment/paypal_transactions/notify' => 'payment/paypal_transactions#notify'
  match 'payment/alipay_transactions/notify' => 'payment/alipay_transactions#notify'
end
