new class @MediaList extends React.Component
  constructor: ->
    @request = new RequestBase(Media)
    @state =
      media: []

  componentDidMount: ->
    @request.getMany('/media').then (response) =>
      @setState(media: response.json)

  render: ->
    media = if @state.media.length
      @state.media.map (media) ->
        <MediaBox key={media._id} media={media} />
    else
      <tr>
        <td colSpan=3 style={{textAlign: 'center'}}>No results to show</td>
      </tr>

    <table className="media-container table table-stripes table-bordered">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Media Type</th>
        </tr>
      </thead>
      <tbody>
        {media}
      </tbody>
    </table>
