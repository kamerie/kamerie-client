class MediaSerializer < ActiveModel::MongoidSerializer
  attributes :_id, :media_type, :media_path, :last_modified
end
