new class @MediaList extends React.Component
  constructor: ->
    @request = new RequestBase(Media)
    @state =
      media: []
      loaded: no

  componentDidMount: ->
    @request.getMany('/media').then (response) =>
      @setState(media: response.json, loaded: yes)

  render: ->
    media = if @state.loaded and @state.media.length
      @state.media.map (media) ->
        <div className="col-xs-6 col-sm-4 col-md-3 col-lg-2">
          <MediaBox key={media._id} media={media} />
        </div>
    else if @state.loaded and not @state.media.length
        <div className="well col-xs-12 text-center">No results to show</div>
    else
        <div className="well col-xs-12 text-center">Loading...</div>

    <div className="container-fluid">
      <div className="row">
        {media}
      </div>
    </div>
