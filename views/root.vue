<template>
  <div id="app">
    <h1>Search Movies</h1>
    <input id="query" type="text"
      placeholder="Movie name"
      v-model="query"
      v-on:keyup="search">

    <div v-if="loading">
      Searching...
    </div>
    <div v-if="!loading && results.length">
      <div v-for="movie of results.slice(0, 10)" v-on:click="add(movie)"
        v-bind:style="{ backgroundColor: MovieList.includes(movie) ? '#eee' : undefined }">
        <h2>{{ movie.original_title }} ({{ movie.release_date }})</h2>
      </div>
    </div>

    <div v-if="MovieList.length">

    </div>
  </div>
</template>

<script>
const debounce = require('debounce')
const request = require('axios')
const MovieList = require('storage/movie-list')
console.debug({MovieList})

const BASE_URL = 'http://localhost:8000'

module.exports = {
  name: 'app',
  methods: {
    search: debounce(function (e) {
      // this hack is to accept any search that CONTAINS keys that are not special keys but
      // doesn't only rely on the last key but any in the query
      this._validKey = !~['Meta', 'Control', 'Shift'].indexOf(e.key) ? e.key : this._validKey
      if (this._validKey == null || !this.query.length) {
        this._validKey = null
        return
      }
      this.loading = true

      console.debug('Searching for', this.query)
      let url = BASE_URL + '/api/search?q=' + encodeURIComponent(this.query)
      request.get(url).then(response => {
        this.results = response.data
        this.loading = false
        this._validKey = null
      })
    }, 500),

    add(movie) {
      console.debug("Adding", movie)
      if (!movie || MovieList.includes(movie))
        return
      console.debug(true)
      MovieList.unshift(movie)
      movie.added = true
    }
  },
  data() {
    return {
      query: '',
      results: [],
      loading: false,
      MovieList: [],
      _validKey: null,
    }
  }
}
</script>

<style lang="less">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;

  h1, h2 {
    font-weight: normal;
  }

  #query {

  }
}
</style>
