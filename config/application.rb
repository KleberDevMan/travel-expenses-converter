require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TravelExpensesConverter
  class Application < Rails::Application
    config.load_defaults 6.1

    # Locale
    config.time_zone = 'America/Sao_Paulo'
    Time::DATE_FORMATS[:hora] = "%H:%M"
    Time::DATE_FORMATS[:default] = "%d/%m/%Y %H:%M"
    Date::DATE_FORMATS[:default] = "%d/%m/%Y"

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = [:en, :"pt-BR"]
    config.i18n.default_locale = :"pt-BR"
    I18n.config.enforce_available_locales = true
    config.encoding = "utf-8"

    config.action_controller.default_protect_from_forgery = true

    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      html_tag
    }

    config.action_dispatch.default_headers = { 'X-Frame-Options' => 'ALLOWALL' }
  end
end
