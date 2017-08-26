// global require function: lib(module)
process.on('SIGUSR2', () => { process.exit(0); })
require('./req')('lib')
require('dotenv').config()
const express = require('express')
const app = express()
const tmdb = lib('server/tmdb')
const cors = require('cors')
const apiRouter = lib('server/api-router')

app.use('/api', cors(), apiRouter)
app.use((err, req, res, next) => {
  if (err) {
    console.error(err)
    return res.status(500).json(err)
  }
})

app.listen(8000, function() {
  console.log('API Server is listening on port 8000')
})
