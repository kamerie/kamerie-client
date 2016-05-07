@toCamelCase = (obj) ->
  return obj unless obj?

  if typeof obj is 'string'
    obj = obj.replace(/_[a-z]/g, (g) -> g[1].toUpperCase())
  else if Array.isArray(obj)
    obj = ((toCamelCase value) for value in obj)
  # else if not isNaN(Number(obj))
    # obj = obj
  else if typeof obj is 'object'
    for own key, value of obj
      obj[toCamelCase key] = (toCamelCase value)
      delete obj[key] unless key is (toCamelCase key)

  return obj
