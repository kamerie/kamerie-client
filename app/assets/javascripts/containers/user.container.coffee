new class @UserBoxContainer extends React.Component
  constructor: ->
    @request = new RequestBase(User)
    @state =
      users: []

  componentDidMount: ->
    @request.getMany('/users').then (response) =>
      @setState(users: response.json)

  render: ->
    users = @state.users.map (user) ->
      <UserBox key={user.id} user={user} />

    <div className="user-container">
      {users}
    </div>
