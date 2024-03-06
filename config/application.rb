require_relative "boot"

require "rails/all"
# require 'ruby_for_grafana_loki'
require 'rails_loki_exporter'
require "pyroscope"
# require 'active_support/log_subscriber'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleRails2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.after_initialize do
      config_file_path = File.join(Rails.root, 'config', 'config.yml')
      logger = RailsLokiExporter.create_logger(config_file_path)
      Rails.logger = logger
    end

    config.generators.system_tests = nil
    config.action_controller.include_all_helpers = true
    config.active_record.sqlite3_production_warning=false
  end
end
