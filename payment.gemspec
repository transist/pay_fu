$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "payment/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "payment"
  s.version     = Payment::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Payment."
  s.description = "TODO: Description of Payment."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  # s.add_dependency "jquery-rails"
  s.add_dependency 'activemerchant'
  s.add_dependency 'activemerchant_patch_for_china'

  s.add_development_dependency "sqlite3"
end
