class Library
  include Mongoid::Document
  store_in collection: 'Library'

  field :media_type
  field :media_path
end
