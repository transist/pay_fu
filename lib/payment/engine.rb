module Payment
  class Engine < ::Rails::Engine
    isolate_namespace Payment
  end
end
