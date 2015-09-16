class OmniauthCallbacksController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    maker = Maker.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Maker.create_with_omniauth(auth)
    sign_in_and_redirect maker, event: :authentication #this will throw if @user is not activated
  end

end
