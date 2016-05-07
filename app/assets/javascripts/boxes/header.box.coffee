class @HeaderBox extends React.Component
  constructor: ->
    # @request = new RequestBase(Media)
    @state =
      user: {}
      open: no

  componentDidMount: ->
    # id = 1 # TODO: use session
    # @request.getOne("/users/#{id}").then (response) =>
      # @setState(user: response.json)


  render: ->
    <nav id="header">
      <div className="container-fluid">
        <div className="navbar-header">
          <a href="/" className="logo">Kamerie</a>
        </div>
        <div className="links-container">
          <ul className="links">
            <LoginLink />
          </ul>
        </div>
      </div>
    </nav>
