class @MediaBox extends React.Component
  render: ->
    poster = <MediaPoster src={@props.media.poster} alt={@props.media.name} />

    <div className="media thumbnail">
      {poster}
      <div className="caption">
        <h4>{@props.media.name}</h4>
        <p>
          Season {@props.media.season}<br />
          Episode {@props.media.episode}
        </p>
      </div>
    </div>
