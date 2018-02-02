require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TemplateRailsAuth
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # config.time_zone = "Seoul"
    config.to_prepare do
      # Configure single controller layout
      Devise::SessionsController.layout "login"
    end

    # config.datafile = config_for(:datafile)
    # config.elastic = config_for(:elastic)
    config.eager_load_paths << Rails.root.join('presenters')
    config.eager_load_paths << Rails.root.join('lib')

  end
end
