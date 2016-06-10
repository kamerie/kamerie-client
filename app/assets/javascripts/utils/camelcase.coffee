@toCamelCase = (obj, ignoredKeys=[]) ->
  return obj unless obj?

  if typeof obj is 'string'
    # debugger
    obj = obj.replace(/_[a-z]/g, (g) -> g[1].toUpperCase()) unless obj in ignoredKeys

  else if Array.isArray(obj)
    obj = ((toCamelCase value, ignoredKeys) for value in obj)
  # else if not isNaN(Number(obj))
    # obj = obj
  else if typeof obj is 'object'
    for own key, value of obj
      if typeof value is 'object'
        value = toCamelCase value, ignoredKeys
      obj[toCamelCase key, ignoredKeys] = value
      delete obj[key] unless key is (toCamelCase key, ignoredKeys)

  return obj
