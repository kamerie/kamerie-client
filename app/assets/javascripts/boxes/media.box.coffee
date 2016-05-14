class @MediaBox extends React.Component
  render: ->
    <tr>
      <th>{@props.media._id}</th>
      <td>{@props.media.name} - {@props.media.SE ? 'Unknown'}</td>
      <td>{@props.media.mediaType}</td>
    </tr>
