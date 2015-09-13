module JsEnv
  extend ActiveSupport::Concern
  included do
    helper_method :js_env
  end

  def js_env
    host = ENV['HOST']

    data = {
      host: host,
      user: current_user.try(:id),
      userName: current_user.try(:name),
      locale: current_user.try(:locale) || 'en',
      apiNamespace: "#{current_user.try(:id)}-#{current_user.try(:locale)}"
    }

    <<-EOS.html_safe
      <script type="text/javascript">
        shared = angular.module('app')
        shared.constant('Rails', #{data.to_json})
      </script>
    EOS
  end
end

