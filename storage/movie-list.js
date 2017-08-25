class MovieList extends Array {
  constructor() {
    super(...arguments)
  }

  includes(value) {
    value = typeof value == 'number' ? value : value.id
    return this.find(movie => movie.id == value)
  }
}
module.exports = new MovieList()
