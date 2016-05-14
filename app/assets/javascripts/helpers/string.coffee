Number::padLeft = (n, str) ->
  Array(n - String(this).length + 1).join(str ? '0') + this
