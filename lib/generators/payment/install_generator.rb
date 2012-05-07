require 'rails/generators'
require File.expand_path('../utils', __FILE__)

module Payment
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)
    include Rails::Generators::Migration
    include Generators::Utils::InstanceMethods
    extend Generators::Utils::ClassMethods

    desc "Payment installation generator"
    def install
      migration_template 'migration.rb', 'db/migrate/create_payment_transactions.rb' rescue display $!.message
      route("mount Payment::Engine => '/payment', :as => 'payment'")
      template "config.yml", "config/payment.yml"
      display "Payment engine is installed."
    end
  end
end
