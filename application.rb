 config.middleware.use Mailgun::Tracking::MailLogger
    config.middleware.use Rack::JSONBodyParser do
      {
        'event' => 'delivered',
        'domain' => 'mailgun.org',
        'message_id' => '<' + params['Message-Id'] + '>',
        'recipient' => params['recipient'],
        'timestamp' => Time.now.to_i,
        'token' => params['token']
      }
    end
