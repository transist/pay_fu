payment
=======

1. add to Gemfile

    gem "payment", :git => "git@github.com:transist/payment.git"

2. bundle install

3. rails generate payment:install, it will create a config file
   config/payment.yml, add a route and migration file

4. update config file config/payment.yml

5. rake db:migrate

6. in controller file, after user clicking checkout, redirect him to
   paypal gateway page.

    include Payment::PaypalHelper
    def action
      ...
      redirect_to_paypal_gateway(:item_name => "subject", :amount => 123)
      return
    end

7. similar for alipay

    include Payment::AlipayHelper
    def action
      ...
      redirect_to_alipay_gateway(:subject => "donatecn", :body => "donatecn", :amount => @donate.amount, :out_trade_no => "123", :notify_url => payment.alipay_transactions_notify_url)
      return
    end
