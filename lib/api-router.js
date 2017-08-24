const router = require('express').Router()
const tmdb = _require('lib/tmdb')

const YEAR_REGEX =  /(\d{2}){2}/i

// const { graphql, buildSchema } = require('graphql')
//
// const movies = buildSchema(`
//   type Movie {
//     name: String
//     year: Integer
//   }
// `)

router.get('/search', (req, res) => {
  console.log('GET /search,', req.query)

  let { q: query, year } = req.query

  if (YEAR_REGEX.test(query)) {
    let matches = YEAR_REGEX.exec(query)
    let yearIdx

    year = year || matches[0]
    yearIdx = query.indexOf(year)
    query = query.slice(0, yearIdx == -1 ? undefined : yearIdx) + query.slice(yearIdx + year.length)
  }

  tmdb('/search/movie/', {query, year}).then(response => {
    console.log('response', response)
    res.json(response.results)
  })
})

module.exports = router
