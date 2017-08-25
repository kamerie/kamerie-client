const path = require('path')

module.exports = function (fn) {
  global[fn] = function appRequire(name) {
    // needs to be a string to avoid warning
    return require(`${path.resolve(__dirname, name)}`)
  }
}
