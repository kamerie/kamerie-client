class MovieList {
  constructor() {
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
      return this.remove(item) && false
    else
      return this.add(item) && true
  }

  get length() {
    return Object.keys(this._movies).length
  }
}
module.exports = new MovieList()
