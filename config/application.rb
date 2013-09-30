require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
#require "action_mailer/railtie"
#require "active_resource/railtie"
#require "rails/test_unit/railtie"
#require "sprockets/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Djr
  class Application < Rails::Application

    config.encoding = "utf-8"

    config.secret_key_base = "teste"

    # Configure sensitive parameters which will be filtered from the log file.
    #config.filter_parameters += [:password]

    #config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    #config.assets.version = '1.0'
  end
end
