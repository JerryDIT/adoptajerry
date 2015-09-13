module API
  class Base < Grape::API
    version 'v1', using: :header, vendor: 'adoptajerry'
    format :json
    default_error_formatter :json
    use ::WineBouncer::OAuth2

    # https://github.com/sethherr/grape-doorkeeper/blob/master/app/controllers/api/v1/root.rb
    rescue_from :all do |e|
      eclass = e.class.to_s
      message = "OAuth error: #{e.to_s}" if eclass.match('WineBouncer::Errors')
      status = case
               when eclass.match('OAuthUnauthorizedError')
                 401
               when eclass.match('OAuthForbiddenError')
                 403
               when eclass.match('RecordNotFound'), e.message.match(/unable to find/i).present?
                 404
               else
                 (e.respond_to? :status) && e.status || 500
               end
      opts = { error: "#{message || e.message}" }
      opts[:trace] = e.backtrace[0,10] unless Rails.env.production?
      Rack::Response.new(opts.to_json, status, {
        'Content-Type' => "application/json",
        'Access-Control-Allow-Origin' => '*',
        'Access-Control-Request-Method' => '*',
      }).finish
    end

    mount API::Comments

    add_swagger_documentation format: :json,
      base_path: '/api', api_version: 'v1',
      hide_documentation_path: true
  end
end
