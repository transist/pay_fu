module Payment
  module PaypalHelper
    def redirect_to_paypal_gateway(options={})
      redirect_to URI.encode("https://www.paypal.com/cgi-bin/webscr?cmd=_ext-enter&redirect_cmd=_xclick&charset=utf-8&business=#{Payment::CONFIGS["paypal"]["email"]}&currenct_code=USD&item_name=#{options[:item_name]}&amount=#{options[:amount]}") and return
    end
  end
end
