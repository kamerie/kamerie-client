class Series
  include Mongoid::Document
  store_in collection: 'Series'
  has_many :media, class_name: 'Media'

  field :name
  field :information
  field :episodes
  field :last_modified

  def poster
    information[:show][:image][:original]
  end
end
