###
# Extend this class to map JSON objects into a model class.
# Example:
#   class MyModel extens ModelBase
#     relations: ->
#       @hasOne(OtherModel, 'otherAttrName')
#       @hasMany(OtherModel, 'otherAttrName2')
#     extraAttributes: ->
#       @computed = @one * @two
###
class @ModelBase
  ###
  # @param attributes <object>: the json object to create the model from
  ###
  constructor: (attributes = {}) ->
    unless typeof attributes is 'object' and not Array.isArray(attributes)
      throw Error("<attributes> must be a JSON")

    attributes = (toCamelCase attributes, ['_id'])

    if typeof attributes['_id'] is 'object' and '$oid' of attributes['_id']
      attributes['_id'] = attributes['_id']['$oid']

    for key, value of attributes
      this[key] = value

    @relations?()
    @extraAttributes?()

  ###
  # One-to-one relation for other model classes.
  # This will create a new object of type `modelClass` inside `key` of the model.
  # @param modelClass <class> class to use for transformation
  # @param key <immutable> key to store transformed child in.
  ###
  hasOne: (modelClass, key) ->
    if typeof modelClass isnt 'function'
      throw Error("<model> must be a constructor")

    this[key] = new modelClass(this[key]) if this[key]?
    @relations.push {modelClass, key, type: 'one'}
    return

  ###
  # One-to-many relation for other model classes.
  # This will create a new array with objects of type `modelClass` inside `key` of the model.
  # @param modelClass <class> class to use for transformation
  # @param key <immutable> key to store transformed child in.
  ###
  hasMany: (modelClass, key) ->
    if typeof modelClass isnt 'function'
      throw Error("<model> must be a constructor")

    this[key] = (new model(item) for item in this[key]) if this[key]?.length
    @relations.push {modelClass, key, type: 'many'}
    return
