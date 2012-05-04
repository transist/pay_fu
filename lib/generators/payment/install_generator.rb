require 'rails/generators'

module RailsAdmin
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)
    include Rails::Generators::Migration

    desc "Payment installation generator"
    def install
      display "Adding a migration..."
      migration_template 'migration.rb', 'db/migrate/create_rails_admin_histories_table.rb' rescue display $!.message
      route("mount Payment::Engine => '/payment', :as => 'payment'")
      display "Job's done: migrate, start your server and visit '/#{namespace}'!", :blueend
    end
  end
end
