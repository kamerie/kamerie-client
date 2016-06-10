class @MediaPoster extends React.Component
  constructor: (@props) ->
  render: ->
    poster = if @props.src?.length
      <div className="thumbnail-poster"
           style={backgroundImage: "url('#{@props.src}')"}
      >
      </div>
    else
      <div className="thumbnail-poster no-poster">
        <span className="no-poster-icon"></span>
      </div>

    <div className="thumbnail-poster-container">
      {poster}
    </div>
