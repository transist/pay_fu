module Payment
  class Engine < ::Rails::Engine
    isolate_namespace Payment

    initializer "payment_engine.load_configs" do |app|
      config_file = Rails.root.join("config/payment.yml")
      if config_file.file?
        require 'active_merchant'
        require 'activemerchant_patch_for_china'

        Payment::CONFIGS = YAML.load_file(config_file)[Rails.env]
        paypal_config = Payment::CONFIGS["paypal"]

        ActiveMerchant::Billing::Base.mode = paypal_config["mode"].to_sym
        ActiveMerchant::Billing::PaypalGateway.new(
          :login => paypal_config["login"],
          :password => paypal_config["password"],
          :signature => paypal_config["signature"]
        )

        ActiveMerchant::Billing::Integrations::Alipay::KEY = Payment::CONFIGS["alipay"]["key"]
        ActiveMerchant::Billing::Integrations::Alipay::ACCOUNT = Payment::CONFIGS["alipay"]["account"]
        ActiveMerchant::Billing::Integrations::Alipay::EMAIL = Payment::CONFIGS["alipay"]["email"]
      end
    end
  end
end
