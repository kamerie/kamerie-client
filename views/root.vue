<template>
  <div id="app">
    <h1>Search Movies</h1>
    <input id="query" type="text"
      placeholder="Movie name"
      autofocus
      v-model="query">

    <h3>{{MovieList.length}} item{{MovieList.length != 1 ? 's' : ''}} in list</h3>

    <div class="loading" v-if="loading">
      Searching...
    </div>
    <div class="results-container"
      v-if="!loading && results.length">
      <a class="search-result"
        v-for="(movie, index) of filteredResults"
        v-on:click.prevent="toggle(index)"
        v-bind:class="{ added: movie.added }"
        href="#">
        <h2>
          [{{ movie.added ? 'Remove' : 'Add' }}]
          {{ movie.original_title }} ({{ movie.release_date }})
        </h2>
      </a>
    </div>

  </div>
</template>

<script>
const debounce = require('debounce')
const request = require('axios')
const MovieList = require('storage/movie-list')
const Vue = require('vue').default

const BASE_URL = 'http://localhost:8000'

module.exports = {
  name: 'app',
  mounted() {
    this.MovieList = MovieList
  },
  methods: {
    search: debounce(function(e) {
      this.results.splice(0)
      if (!this.query.length)
        return

      this.loading = true
      let query = this.query
      let url = BASE_URL + '/api/search?q=' + encodeURIComponent(query)
      console.debug('Searching for', query)

      request.get(url).then(response => {
        console.debug(response.data ? response.data.length : 0, 'results found for', query)
        this.results = response.data
        this.loading = false
      })
    }, 500),
    toggle(index) {
      let movie = this.results && this.results[index]
      if (!movie)
        return

      movie.added = MovieList.toggle(movie)
      Vue.set(this.results, index, movie)
      return movie.added
    }
  },
  watch: {
    query() {
      this.search()
    }
  },
  computed: {
    filteredResults() {
      let page = (this.page || 0) * this.pageSize
      return this.results.slice(page, this.pageSize).map(movie => {
        movie.added = MovieList.get(movie) != null
        return movie
      })
    }
  },
  data() {
    return {
      query: '',
      results: [],
      loading: false,
      MovieList: [],
      page: 0,
      pageSize: 10
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
  max-width: 600px;
  margin: 0 auto;

  h1, h2 {
    font-weight: normal;
  }

  a:visited {
    color: currentColor;
  }

  #query {
    padding: 15px 7px;
    font-size: 1.3em;
    border: 1px solid #dcdcdc;
    transition: border .3s ease-in-out;
    width: 100%;

    &:focus {
      outline: 0;
      border-color: #3b99fc;
    }
  }

  .search-result {
    font-weight: 500;
    text-decoration: none;
    border-bottom: 1px solid #ddd;
    display: block;
    padding: 7px;

    &.added {
      background: #efe;
    }

    &:hover {

    }
  }
}
</style>
