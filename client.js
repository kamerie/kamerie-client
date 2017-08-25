// require('./req')('kamerie')
const Vue = require('vue').default
const root = require('./views/root.vue')

new Vue({
  el: '#root',
  render(h) { return h(root) }
})
