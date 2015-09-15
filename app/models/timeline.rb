class Timeline
  include ActiveAttr::Model
  include ActionView::Helpers::TextHelper
  include Rails.application.routes.url_helpers

  attribute :jerry_id, type: Integer
  attribute :activities, type: Array

  def jerry
    Jerry.find jerry_id if jerry_id
  end

  def activities
    list = []
    activities = []

    if jerry
      comments = jerry.comments.reverse
      uploads = []
      versions = []
      activities = (comments + uploads + versions).sort_by { |k| k.created_at } .reverse
    end

    activities.each do |activity|

      case activity.class.name
      when "PaperTrail::Version"
        type = "version"
        picto = "history"
        maker = Maker.find_by_id(activity.whodunnit.to_i) if activity.whodunnit
        verb = ""
        content = ""
        changeset = activity.changeset
      when "Comment"
        type = "comment"
        picto = "comments"
        maker = activity.maker
        verb = "commented"
        content = simple_format(activity.comment)
      when "Upload"
        type = "upload"
        picto = "file"
        maker = activity.maker
        verb = "uploaded"
        object = "a_file"
        content = ""
        downloadLink = download_upload_path(activity)
        downloadName = activity.file_file_name
      end

      time = activity.created_at

      if type && time

        item = {
          type: type,
          mode: (['comment', 'upload'].include?(type)) ? 'highlighted' : 'normal',
          picto: picto,
          maker_name: maker.try(:name),
          maker_id: maker.try(:id),
          verb: verb,
          object: object,
          content: content,
          changeset: changeset,
          downloadLink: downloadLink,
          downloadName: downloadName,
          time: time
        }

        list << item
      end

    end

    list
  end
end
