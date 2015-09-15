module API
  module Defaults
    extend ActiveSupport::Concern

    included do
      before do
        I18n.locale = resource_owner.locale if resource_owner
      end

      helpers do
        def current_token
          doorkeeper_access_token
        end

        def current_maker
          resource_owner
        end

        def current_scopes
          current_token.scopes
        end
      end
    end

  end
end
