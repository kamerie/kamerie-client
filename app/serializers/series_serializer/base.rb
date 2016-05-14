class SeriesSerializer::Base < ActiveModel::MongoidSerializer
  attributes :_id, :name, :information, :episodes, :poster
end
