module PayFu
  module PaypalHelper
    def redirect_to_paypal_gateway(options={})
      host = ActiveMerchant::Billing::Base.mode == "test" ? "www.sandbox.paypal.com" : "www.paypal.com"
      redirect_to URI.encode("https://#{host}/cgi-bin/webscr?cmd=_ext-enter&redirect_cmd=_xclick&charset=utf-8&business=#{PayFu::CONFIGS["paypal"]["email"]}&currenct_code=USD&item_name=#{options[:item_name]}&amount=#{options[:amount]}")
    end
  end
end
