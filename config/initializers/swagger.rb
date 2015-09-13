GrapeSwaggerRails.options.url      = '/api/swagger_doc'
GrapeSwaggerRails.options.app_url  = '/'
GrapeSwaggerRails.options.app_name = 'Adopt a Jerry'

GrapeSwaggerRails.options.api_auth     = 'bearer' # Or 'bearer' for OAuth
GrapeSwaggerRails.options.api_key_name = 'Authorization'
GrapeSwaggerRails.options.api_key_type = 'header'

class CanAccessAPIDocumentation # Use in the routes file
  def self.matches?(request)
    # current_user = request.env['warden'].user
    # Ability.new(current_user).can? :manage, GrapeSwaggerRails
    true
  end
end
