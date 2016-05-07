class Library
  include Mongoid::Document
  store_in collection: 'Library'

  field :library_type
  field :library_path
  field :last_modified
end
