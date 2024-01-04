require_relative "boot"

require "rails/all"
require 'ruby_for_grafana_loki'
# require 'rails_loki_exporter_dev'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleRails2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.after_initialize do
      config_file_path = File.join(Rails.root, 'config', 'config.yml')
      logger = RubyForGrafanaLoki.create_logger(config_file_path)
      # logger = RailsLokiExporterDev.create_logger(config_file_path)
      Rails.logger = logger
    end
  end
end
