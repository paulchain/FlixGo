import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import VueAxios from 'vue-axios'

Vue.use(Vuex)
Vue.use(VueAxios, axios)

export default new Vuex.Store({
  state: {
    catalog: [],
    movies: [],
    country: []
  },
  mutations: {
    createCatalog (state) {
      axios
      .get('http://localhost/REST/API/catalog.php/GetAllCatalog?id=3')
      .then(response => (state.catalog = response.data))
      },
    getMovie (state){
      axios
      .get('http://localhost/REST/API/movie.php/GetAllInfomation')
      .then(response => (state.movies = response.data))
    },
    getCountry (state){
      axios
      .get('http://localhost/REST/API/country.php/country')
      .then(response => (state.country = response.data))
    },
  },
  computed: {
  },
  getters: {
    GetMovieEvaluate(state) {
      return state.movies.sort(function(a,b){
        if(a.evaluate < b.evaluate)
          return 1
        else{
          return -1
        }
      }).slice(0,8)
    },
    GetMovieNew(state) {
      return state.movies.sort(function(a,b){
        if(a.id < b.id)
          return 1
        else{
          return -1
        }
      }).slice(0,8)
    },
    GetMovieFilm(state) {
      return state.movies.filter(function(movie){
        return movie.is_film == 0
      })
    },
    GetMovieFilms(state) {
      return state.movies.filter(function(movie){
        return movie.is_film != 0
      })
    },
  },
  actions: {
    createCatalog (context) {
      context.commit('createCatalog')
    },
    getMovie (context) {
      context.commit('getMovie')
    },
    getCountry (context) {
      context.commit('getCountry')
    }
  },
})
