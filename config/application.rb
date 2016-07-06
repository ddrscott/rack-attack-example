require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RackAttack

  class HijackHandler
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['REQUEST_PATH'].starts_with?('/hijack')
        [200, {}, ["Rack attack owns you! (And we're fast, too)"]]
      else
        # Pass it down the chain to Rails default middlewares
        @app.call(env)
      end
    end
  end

  class Application < Rails::Application

    config.active_record.raise_in_transactional_callbacks = true

    config.middleware.insert_before 0, 'RackAttack::HijackHandler'
  end
end
