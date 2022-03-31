require_relative 'boot'

# This line adds too many libraries that Im not really using, below are the requires 1 by 1 that
# I really need. Check out what rails/all.rb is currently expanded to:
# https://github.com/rails/rails/blob/master/railties/lib/rails/all.rb

# require "rails/all"
require 'active_record/railtie'
# require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'action_mailer/railtie'
require 'active_job/railtie'
require 'action_cable/engine'
# require 'action_mailbox/engine'
require 'action_text/engine'
require 'rails/test_unit/railtie'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dado
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    # This line removes active_storage generated routes
    config.active_storage.draw_routes = false
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.generators do |g|
      g.test_framework :rspec,
                       views_specs: false
      g.helper false
      g.jbuilder false
    end
  end
end
