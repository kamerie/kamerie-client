// global require function: _require(module)
require('./req')('_require')
require('dotenv').config()
const express = require('express')
const app = express()
const tmdb = _require('lib/tmdb')
const cors = require('cors')
const apiRouter = _require('lib/api-router')

app.use('/api', cors(), apiRouter)
app.use((err, req, res, next) => {
  if (err) {
    console.error(err)
    return res.status(500).json(err)
  }
})

app.listen(8000, function() {
  console.log('Listening on port 8000')
})
