class MovieList {
  constructor() {
    console.debug('MovieList.constructor', ...arguments)
    this._movies = {}
  }

  add(item) {
    return this._movies[item.id] = item
  }

  remove(item) {
    return delete this._movies[item.id]
  }

  get(item) {
    return this._movies[item.id]
  }

  toggle(item) {
    if (this.get(item))
      return this.remove(item)
    else
      return this.add(item)
  }
}
module.exports = new MovieList()
