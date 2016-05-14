class LibrarySerializer < ActiveModel::MongoidSerializer
  attributes :_id, :library_type, :library_path, :last_modified
end
