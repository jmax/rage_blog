require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RageBlog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

require "rage/rails"

Rails.configuration.after_initialize do
  Rage.configure do
    config.server.workers_count = 1

    config.middleware.use Rage::Cors do
      allow "localhost:5173", "https://clumsy-squirrel-4315.pages.dev"
    end

    config.middleware.use ActionDispatch::HostAuthorization
    if Rails.env.development?
      config.middleware.use ActiveRecord::Migration::CheckPending
    end
  end
end
