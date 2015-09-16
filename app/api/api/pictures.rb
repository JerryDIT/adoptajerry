module API
  class Pictures < Grape::API
    include API::Defaults

    resource :pictures do

      desc 'Returns success'
      params do
        optional :access_token, type: String # useful for swagger
      end
      delete ':id' do
        picture = Picture.find params[:id]
        picture.destroy
        {}
      end

    end
  end
end
