# pay_fu

a rails payment engine that supports both alipay and paypal.

## Setup

1) add to Gemfile

```ruby
gem "pay_fu"
```

2) install gem

```bash
bundle install
```

3) generate config file, route and migration file

```bash
rails generate pay_fu:install
```

4) update config file config/pay_fu.yml

5) run migration

```bash
rake db:migrate
```

6) in controller file, after user clicking checkout, redirect him to
   paypal gateway page.

```ruby
include PayFu::PaypalHelper
def action
  ...
  redirect_to_paypal_gateway(:item_name => "subject", :amount => 123)
  return
end
```

7) similar for alipay

```ruby
include PayFu::AlipayHelper
def action
  ...
  redirect_to_alipay_gateway(:subject => "donatecn", :body => "donatecn", :amount => @donate.amount, :out_trade_no => "123", :notify_url => pay_fu.alipay_transactions_notify_url)
  return
end
```
