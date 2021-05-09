class ApplicationController < ActionController::Base
  add_flash_types :primary, :secundary, :success, :danger, :warning, :info
  around_action :switch_locale

  before_action :authorized

  helper_method :current_user
  helper_method :logged_in?

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  # Get locale from top-level domain or return +nil+ if such locale is not available
  # You have to put something like:
  #   127.0.0.1 application.com
  #   127.0.0.1 application.it
  #   127.0.0.1 application.pl
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    pp "session[:user_id]"
    pp session[:user_id]

    pp "logged_in?"
    pp logged_in?
    redirect_to new_session_url unless logged_in?
  end
end
