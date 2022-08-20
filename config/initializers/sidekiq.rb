Sidekiq.configure_server do |config|
  config.logger.level = Rails.logger.level

  ActiveRecord::Base.logger = Sidekiq.logger
  Rails.logger = Sidekiq.logger
end
