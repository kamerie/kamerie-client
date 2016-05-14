class MediaSerializer::Full < MediaSerializer::Base
  attributes :series
  has_one :series, serializer: SeriesSerializer
end
