MawidaQA::Application.config.action_mailer.default_url_options = { host: APP_CONFIG['public_host'] }
MawidaQA::Application.config.action_mailer.smtp_settings = APP_CONFIG['smtp'].symbolize_keys