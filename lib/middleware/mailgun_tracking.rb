# frozen_string_literal: true

require 'logger'
require 'mailgun-ruby'
require 'mailgun/tracking'
require 'rack/contrib'
Mailgun::Tracking.configure do |config|
  config.api_key = ENV['MAILGUN_API_KEY']
  config.endpoint = ENV['MAILGUN_TRACKING_ENDPOINT']
end
module Mailgun::Tracking
  class MailLogger
    def initialize(app, options = {})
      @app = app
      @options = options
      @logger = options[:logger] || Logger.new(STDOUT)
      @delivered = options[:delivered] || false
      @bounced = options[:bounced] || Logger.new(STDOUT)
    end

    def call(env)
      @logger.info(Mailgun::Tracking::MailLogger)
      @logger.info(env)
      # Make request
      request = Rack::Request.new(env)
      if request.post? && request.params['event'] == 'delivered'
        @logger.info('Mailgun::Tracking::MailLogger: event delivered' )
        @logger.info(request.params)
        Mailgun::Tracking::MailLogger.create(request.params)
      end
      @app.call(env)
    end
  end
end

