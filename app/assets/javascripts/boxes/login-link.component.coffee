class @LoginLink extends React.Component
  componentDidMount: ->
    node = ReactDOM.findDOMNode(this)

    @drop = new Drop {
      target: node
      position: 'bottom center'
      content: ' '
      openOn: 'click'
      classes: 'drop-theme-basic drop-theme-arrows'
    }

    ReactDOM.render(<a href="#" onClick={->no} className="login">Login</a>, node)
    ReactDOM.render(<h2>Login here</h2>, @drop?.drop?.firstChild)

  render: ->
    <li />
