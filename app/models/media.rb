class Media
  include Mongoid::Document
  store_in collection: 'Media'

  field :media_type
  field :media_path
  field :last_modified

  scope :series, -> { where(media_type: 'series') }
  scope :movies, -> { where(media_type: 'movie') }
end
