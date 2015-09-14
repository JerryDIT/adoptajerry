module API
  module Resources
    class Timeline < Grape::Entity
      expose :activities
      expose :jerry_id
    end
  end
end
