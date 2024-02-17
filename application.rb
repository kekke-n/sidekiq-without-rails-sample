# frozen_string_literal: true

require 'sidekiq'

redis_url = ENV.fetch('REDIS_URL', 'redis://localhost:6379')

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url}
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url}
end

class SampleJob
  include Sidekiq::Job

  def perform(params)
    puts "params: #{params}"
  end
end

class SleepJob
  include Sidekiq::Job

  def perform
    sleep 300
  end
end