class Api::V1::MakersController < ApplicationController

  def me
    access_token = Doorkeeper::AccessToken.create!(resource_owner_id: current_maker.id,
                                                   expires_in: 20.minutes, scopes: 'public')

    render json: { token: access_token.token }
  end
end
