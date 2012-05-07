module Payment
  class Engine < ::Rails::Engine
    isolate_namespace Payment

    initializer "payment_engine.load_configs" do |app|
      config_file = Rails.root.join("config/payment.yaml")
      if config_file.file?
        CONFIGS = YAML.load_file(config_file)[Rails.env]
        paypal_config = CONFIGS["paypal"]

        ActiveMerchant::Billing::Base.mode = paypal_config["mode"]
        ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(
          :login => paypal_config["login"],
          :password => paypal_config["password"],
          :signature => paypal_config["signature"]
        )

        ActiveMerchant::Billing::Integrations::Alipay::KEY = CONFIGS["alipay"]["key"]

        require 'active_merchant'
        require 'active_merchant/billing/integrations/action_view_helper'

        ActionView::Base.send(:include, ActiveMerchant::Billing::Integrations::ActionViewHelper)
      end
    end

    initializer "warn when configuration is missing" do
      config.after_initialize do
        unless Rails.root.join("config/payment.yml").file?
          puts "\nPayment config not found. Create a config file at: config/payment.yml"
          puts "to generate one run: rails generate payment:config\n\n"
        end
      end
    end
  end
end
