# Load the Rails application.
require_relative 'application'
require 'ipinfo-rails'

Rails.application.config.middleware.use(IPinfoMiddleware, { token: Rails.configuration.ip_info[:token] })
# Initialize the Rails application.
Rails.application.initialize!
