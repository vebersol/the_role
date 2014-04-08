module TheRole
  def self.configure(&block)
    yield @config ||= TheRole::Configuration.new
  end

  def self.config
    @config
  end

  # Configuration class
  class Configuration
    include ActiveSupport::Configurable
    config_accessor :layout,
                    :destroy_strategy,
                    :default_user_role,
                    :access_denied_method,
                    :login_required_method,
                    :first_user_should_be_admin,
                    :model_name
  end

  configure do |config|
    config.layout                     = :application

    config.default_user_role          = nil
    config.first_user_should_be_admin = false
    config.access_denied_method       = :access_denied
    config.login_required_method      = :authenticate_user!
    config.destroy_strategy           = :restrict_with_exception # can be nil
    config.model_name                 = :user
  end
end