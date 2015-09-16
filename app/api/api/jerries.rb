module API
  class Jerries < Grape::API
    include API::Defaults

    resource :jerries do

      desc 'Returns all the jerries'
      params do
        optional :access_token, type: String # useful for swagger
      end
      get do
        present Jerry.all, with: API::Resources::Jerry
      end

      desc 'Returns a jerry'
      params do
        optional :access_token, type: String # useful for swagger
      end
      get ':id' do
        jerry = Jerry.find params[:id]
        present jerry, with: API::Resources::Jerry, type: :full
      end

    end
  end
end
