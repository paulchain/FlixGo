import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import VueCarousel from 'vue-carousel'
import  lineClamp from 'vue-line-clamp';
import VuePlyr from 'vue-plyr'
Vue.use(VuePlyr)
Vue.use(VueCarousel)
Vue.use(lineClamp)

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

