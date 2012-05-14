require 'rails/generators'
require File.expand_path('../utils', __FILE__)

module PayFu
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)
    include Rails::Generators::Migration
    include Generators::Utils::InstanceMethods
    extend Generators::Utils::ClassMethods

    desc "PayFu installation generator"
    def install
      migration_template 'migration.rb', 'db/migrate/create_pay_fu_transactions.rb' rescue display $!.message
      route("mount PayFu::Engine => '/pay_fu', :as => 'pay_fu'")
      template "config.yml", "config/pay_fu.yml"
      display "PayFu engine is installed."
    end
  end
end
