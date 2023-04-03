require_relative "boot"

require "rails/all"
require 'jwt/auth'
require 'jwt'

Bundler.require(*Rails.groups)

module RailsBoilerplate
  class Application < Rails::Application
    config.load_defaults 7.0
    config.cache_store = :redis_cache_store, { url: ENV["REDIS_URL"] }

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "*"
        resource "*", headers: :any, methods: %i[get post put patch delete options head]
      end
    end

    # config.middleware.use ActionDispatch::Cookies
    # config.middleware.use ActionDispatch::Session::CookieStore, key: '_cookie_name', expire_after: 1.weeks
    # config.middleware.use JWT::Middleware do |chain|
    # chain.use JWT::Auth do |opts|
    #   opts.secret = 'MySecretKey'
    #   end
    # end
  end
end
