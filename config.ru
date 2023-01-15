# frozen_string_literal: true

require 'bundler/setup'

Bundler.require(:default)

require 'securerandom'
require 'sidekiq/web'

use Rack::Session::Cookie, secret: SecureRandom.hex(32), same_site: true, max_age: 86400
run Sidekiq::Web
