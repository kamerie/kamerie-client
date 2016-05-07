class @SocketBase
  _adapter: FetchAdapter

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
      console.debug "SocketBase getOne,", url

      @_adapter.get(url, params)
        .then (response) =>
          console.debug "SocketBase getOne success, resolving", response
          response.json().then (body) =>
            response.json = new @transformTo(body)
            resolve(response)
        .catch (response) ->
          console.debug "SocketBase getOne error, rejecting", response
          reject(response)

  getMany: (url, params) ->
    new Promise (resolve, reject) =>
      console.debug "SocketBase getMany,", url

      @_adapter.get(url, params)
        .then (response) =>
          console.debug "SocketBase getMany success, resolving", response
          response.json().then (body) =>
            response.json = (new @transformTo(item) for item in body)
            resolve(response)
        .catch (response) ->
          console.debug "SocketBase getMany error, rejecting", response
          reject(response)
