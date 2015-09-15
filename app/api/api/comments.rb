module API
  class Comments < Grape::API
    include API::Defaults

    resource :comments do
      desc 'Returns the saved comment'
      params do
        optional :access_token, type: String # useful for swagger
        optional :content, type: String
        optional :commentable_type, type: String
        optional :commentable_id, type: Integer
      end
      oauth2 'public'
      post do
        if params[:commentable_type].present? && params[:commentable_id].present?
          if params[:commentable_type] == "Jerry"
            commentable = Jerry.find params[:commentable_id]
            commentable = nil unless current_maker.can?(:read, commentable)
          end
        end

        if commentable && params[:content].present?
          comment = Comment.new
          comment.user = current_maker
          comment.commentable = commentable
          comment.comment = params[:content]
          comment.save

          present comment, with: API::Resources::Comment
        else
          error! "Error while saving the comment", 406
        end
      end

      get do
        present Comment.all, with: API::Resources::Comment
      end

    end
  end
end
