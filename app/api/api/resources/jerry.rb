module API
  module Resources
    class Jerry < Grape::Entity
      expose :id
      expose :name
      expose :bio
      expose :location
      expose :avatar do |jerry, options|
        jerry.avatar.path
      end
      expose :created_at
      expose :updated_at
    end
  end
end
