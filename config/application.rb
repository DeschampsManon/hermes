require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hermes
  class Application < Rails::Application
    config.assets.initialize_on_precompile = false
  end
end