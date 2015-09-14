module API
  class Timelines < Grape::API
    include API::Defaults

    resource :timelines do
      desc 'Returns a timeline for a given jerry'
      params do
        optional :access_token, type: String # useful for swagger
        optional :jerry_id, type: Integer
      end
      get do
        timeline = Timeline.new

        if params[:jerry_id].present?
          timelinable = jerry = Jerry.find params[:jerry_id]
        end

        if timelinable
          timeline.jerry_id = jerry.id if jerry
          present timeline, with: API::Resources::Timeline
        else
          error!('401 Unauthorized', 401)
        end
      end

    end
  end
end
