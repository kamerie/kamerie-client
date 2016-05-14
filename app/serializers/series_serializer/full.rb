class SeriesSerializer::Full < SeriesSerializer::Base
  attributes :media
  has_many :media, each_serializer: MediaSerializer::Base
end
