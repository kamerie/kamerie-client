class @MediaBox extends React.Component
  render: ->
    <tr>
      <th>{@props.media._id}</th>
      <td>{@props.media.mediaPath}</td>
      <td>{@props.media.mediaType}</td>
    </tr>
