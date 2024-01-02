require_relative "boot"

require "rails/all"
require 'rails_loki_exporter_dev'

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
      logger = RailsLokiExporterDev.create_logger(config_file_path)
      Rails.logger = logger
      Rails.logger.warn("[WARN] This is a warning message from the controller.")
      Rails.logger.error("[ERROR] This is an error message from the controller.")
      Rails.logger.fatal("[FATAL] This is a fatal error message from the controller.")
      Rails.logger.info("This is an info message from the controller.")
      Rails.logger.info("This is an info message from the controller.")
      Rails.logger.info("This is an info message from the controller.")
    end
  end
end
