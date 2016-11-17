module Contact
  class Engine < ::Rails::Engine
    isolate_namespace Contact

    config.generators do |g|
      g.api_only = true
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
