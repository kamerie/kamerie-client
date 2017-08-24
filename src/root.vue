<template>
  <div id="app">
    <h1>Search Movies</h1>
    <input id="query" type="text"
      placeholder="Movie name"
      v-model="query"
      v-on:keyup="search(this.value)">

    <ul v-if="movieList.length">
      <li v-for="movie of movieList.slice(0, 10)">
        <h2>{{ movie.name }}</h2>
        <h3>{{ movie.year }}</h3>
        {{ movie }}
      </li>
    </ul>
  </div>
</template>

<script>
const debounce = require('debounce')
const request = require('axios')

const BASE_URL = 'http://localhost:8000'

module.exports = {
  name: 'app',
  methods: {
    search: debounce(function () {
      if (!this.query.length) return

      console.debug('Searching for', this.query)
      let url = BASE_URL + '/api/search?q=' + encodeURIComponent(this.query)
      request.get(url).then((response) => {
        this.movieList = response
      })
    }, 500)
  },
  data() {
    return {
      query: '',
      movieList: []
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
