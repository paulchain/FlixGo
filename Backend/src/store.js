import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import VueAxios from 'vue-axios'

Vue.use(Vuex)
Vue.use(VueAxios, axios)

export default new Vuex.Store({
  state: {
    catalog: [],
    movie: []
  },
  mutations: {
    createCatalog (state) {
      axios
      .get('http://localhost/REST/API/catalog.php/catalog')
      .then(response => (state.catalog = response.data))
      },
    getMovie (state){
      axios
      .get('http://localhost/REST/API/movie.php/movie')
      .then(response => (state.movie = response.data))
    }
  },
  actions: {
    createCatalog (context) {
      context.commit('createCatalog')
    },
    getMovie (context) {
      context.commit('getMovie')
    },
  },
  getters: {
    GetMovieEvaluate(state) {
      return state.movie
    }
  }
})
