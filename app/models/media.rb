class Media
  include Mongoid::Document
  store_in collection: 'Media'
  belongs_to :series, class_name: 'Series'

  field :name
  field :season
  field :episode
  field :media_type
  field :media_path
  field :last_modified

  scope :series, -> { where(media_type: 'series') }
  scope :movies, -> { where(media_type: 'movie') }
end
