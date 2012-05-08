module Payment
  module PaypalHelper
    def redirect_to_paypal_gateway(item_name, amount)
      redirect_to URI.encode("https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=#{Payment::CONFIGS["paypal"]["email"]}&currenct_code=USD&item_name=#{item_name}&amount=#{amount}")
    end
  end
end
