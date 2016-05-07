new class @MediaList extends React.Component
  constructor: ->
    @request = new RequestBase(Media)
    @state =
      media: []

  componentDidMount: ->
    @request.getMany('/media').then (response) =>
      @setState(media: response.json)

  render: ->
    media = @state.media.map (media) ->
      <MediaBox key={media._id} media={media} />

    <table className="media-container table table-stripes table-bordered">
      <thead>
        <tr>
          <th>ID</th>
          <th>Media Path</th>
          <th>Media Type</th>
        </tr>
      </thead>
      <tbody>
        {media}
      </tbody>
    </table>
