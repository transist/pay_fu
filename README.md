pay_fu
=======

1. add to Gemfile

    gem "pay_fu", :git => "git@github.com:transist/pay_fu.git"

2. bundle install

3. rails generate pay_fu:install, it will create a config file
   config/pay_fu.yml, add a route and migration file

4. update config file config/pay_fu.yml

5. rake db:migrate

6. in controller file, after user clicking checkout, redirect him to
   paypal gateway page.

    include PayFu::PaypalHelper
    def action
      ...
      redirect_to_paypal_gateway(:item_name => "subject", :amount => 123)
      return
    end

7. similar for alipay

    include PayFu::AlipayHelper
    def action
      ...
      redirect_to_alipay_gateway(:subject => "donatecn", :body => "donatecn", :amount => @donate.amount, :out_trade_no => "123", :notify_url => pay_fu.alipay_transactions_notify_url)
      return
    end
