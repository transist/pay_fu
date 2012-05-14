$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pay_fu/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pay_fu"
  s.version     = PayFu::VERSION
  s.authors     = ["Richard Huange"]
  s.email       = ["flyerhzm@gmail.com"]
  s.homepage    = "https://github.com/transist/pay_fu"
  s.summary     = "pay_fu engine"
  s.description = "pay_fu engine"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  # s.add_dependency "jquery-rails"
  s.add_dependency 'activemerchant'
  s.add_dependency 'activemerchant_patch_for_china'

  s.add_development_dependency "sqlite3"
end
