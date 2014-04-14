class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    maker = Maker.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Maker.create_with_omniauth(auth)
    session[:maker_id] = maker.id
    redirect_to root_url, notice: "Signed in!"
  end
  def destroy
    session[:maker_id] = nil
    redirect_to root_url, notice: 'Signed out!'
  end
end
