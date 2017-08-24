const Vue = require('vue').default
const app = require('./src/root.vue')

new Vue({
  el: '#root',
  render(h) { h(app) }
})
