class @LoginLink extends React.Component
  componentDidMount: ->
    node = ReactDOM.findDOMNode(this)

    new Drop {
      target: node
      position: 'bottom center'
      content: '<h1>Login</h1>'
      openOn: 'click'
      classes: 'drop-theme-basic drop-theme-arrows'
    }

    ReactDOM.render(<a href="#" onClick={->no} className="login">Login</a>, node)

  render: ->
    <li />
