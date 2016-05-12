class @MongoModel extends ModelBase
  constructor: (attributes = {}) ->
    if typeof attributes._id is 'object' and '$oid' of attributes._id
      attributes_id = attributes_id.$oid

    super
