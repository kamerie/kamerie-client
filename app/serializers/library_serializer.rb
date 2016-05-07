class LibrarySerializer < ActiveModel::MongoidSerializer
  attributes :_id, :media_type, :media_path
end
