PayFu::Engine.routes.draw do
  match '/paypal_transactions/notify' => 'paypal_transactions#notify'
  match '/alipay_transactions/notify' => 'alipay_transactions#notify'
end
