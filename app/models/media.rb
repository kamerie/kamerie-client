class Media
  include Mongoid::Document
  store_in collection: 'Media'

  field :media_type
  field :media_path
  field :last_modified
end
