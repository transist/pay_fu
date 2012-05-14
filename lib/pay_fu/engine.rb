module PayFu
  class Engine < ::Rails::Engine
    isolate_namespace PayFu

    initializer "pay_fu_engine.load_configs" do |app|
      config_file = Rails.root.join("config/pay_fu.yml")
      if config_file.file?
        require 'active_merchant'
        require 'activemerchant_patch_for_china'

        PayFu::CONFIGS = YAML.load_file(config_file)[Rails.env]
        paypal_config = PayFu::CONFIGS["paypal"]

        ActiveMerchant::Billing::Base.mode = paypal_config["mode"].to_sym
        ActiveMerchant::Billing::PaypalGateway.new(
          :login => paypal_config["login"],
          :password => paypal_config["password"],
          :signature => paypal_config["signature"]
        )

        ActiveMerchant::Billing::Integrations::Alipay::KEY = PayFu::CONFIGS["alipay"]["key"]
        ActiveMerchant::Billing::Integrations::Alipay::ACCOUNT = PayFu::CONFIGS["alipay"]["account"]
        ActiveMerchant::Billing::Integrations::Alipay::EMAIL = PayFu::CONFIGS["alipay"]["email"]
      end
    end
  end
end
