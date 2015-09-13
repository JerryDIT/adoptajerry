module API
  module Resources
    class Comment < Grape::Entity
      expose :id
      expose :comment
      expose :commentable_type
      expose :commentable_id
      expose :user, using: API::Resources::User
    end
  end
end
