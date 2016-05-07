class @RequestBase
  _adapter: FetchAdapter
  _namespace: '/api'

  constructor: (@transformTo, @config) ->
    throw new Error("transformTo argument must be specified") unless @transformTo?
    # throw new Error("config argument must be specified") unless @config?

  ###
  # Makes AJAX req for single item in response and transforme the response.
  # @param url <string>: request URL
  # @param params: <object/string>: Request parameters
  # @return <Promise> promise that will include transformed request inside `json` key
  ###
  getOne: (url, params) ->
    new Promise (resolve, reject) =>
      console.debug "RequestBase getOne,", url

      @_adapter.get(@url(url), params)
        .then (response) =>
          console.debug "RequestBase getOne success, resolving", response
          response.json().then (body) =>
            response.json = new @transformTo(body)
            resolve(response)
        .catch (response) ->
          console.debug "RequestBase getOne error, rejecting", response
          reject(response)

  getMany: (url, params) ->
    new Promise (resolve, reject) =>
      console.debug "RequestBase getMany,", url

      @_adapter.get(@url(url), params)
        .then (response) =>
          console.debug "RequestBase getMany success, resolving", response
          response.json().then (body) =>
            response.json = (new @transformTo(item) for item in body)
            resolve(response)
        .catch (response) ->
          console.debug "RequestBase getMany error, rejecting", response
          reject(response)

  url: (url) ->
    [@_namespace, url].join('/')
