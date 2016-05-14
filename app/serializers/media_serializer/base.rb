class MediaSerializer::Base < ActiveModel::MongoidSerializer
  attributes :_id, :name, :episode, :season, :media_type, :media_path, :last_modified, :poster

  def poster
    object.series.poster if object.series.present?
  end
end
