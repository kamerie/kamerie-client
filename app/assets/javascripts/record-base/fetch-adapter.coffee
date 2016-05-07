###
# This class simplifies AJAX requests for other classes.
###

@FetchAdapter =
  new class FetchAdapter
    ###
    # @param url <string>: request URL
    # @param params: <object/string>: Request parameters
    ###
    get: (url, params) ->
      headers = new Headers()

      # this is a get request, merge url with all params specified
      [url, queryParams] = url.split('?')
      objectParams = @paramsAsQueryString(params)
      finalUrl = url
      finalUrl += '?' + queryParams if queryParams?.length
      finalUrl += '&' + objectParams if objectParams?.length

      # config for fetch
      init =
        headers: headers
        method: 'GET'
        mode: 'same-origin'
        cache: 'default'

      ### this is awesome. @see https://developer.mozilla.org/en-US/docs/Web/API/GlobalFetch/fetch ###
      return fetch(finalUrl, init)

    paramsAsObject: (params) ->
      objectParams = {}
      if typeof params is 'string'
        for i in params.split(/&;/)
          for key, val in i.split('=')
            objectParams[key] = val
      else if typeof params is 'object'
        objectParams = params

      objectParams

    paramsAsQueryString: (params) ->
      params = @paramsAsObject(params)
      queryString = []
      for key, val of params
        queryString.push "#{key}=#{val}"

      queryString.join('&')
