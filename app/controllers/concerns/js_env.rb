module JsEnv
  extend ActiveSupport::Concern
  included do
    helper_method :js_env
  end

  def js_env
    host = ENV['HOST']

    data = {
      host: host,
      user: current_maker.try(:id),
      userName: current_maker.try(:name),
      locale: current_maker.try(:locale) || 'en',
      apiNamespace: "#{current_maker.try(:id)}-#{current_maker.try(:locale)}"
    }

    <<-EOS.html_safe
      <script type="text/javascript">
        shared = angular.module('app')
        shared.constant('Rails', #{data.to_json})
      </script>
    EOS
  end
end

