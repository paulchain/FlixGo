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
    country: [],
    onemovie: [],
    comments: null,
    statusVideo: false,
    user: {
      name: '',
      avatar: ''
    },
    checkuser: false
  },
  mutations: {
    createUser (state, user){
      state.user = user;
      state.checkuser = true;
    },
    createCatalog (state) {
      axios
      .get('http://localhost/REST/API/catalog.php/GetAllCatalog')
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
    getMovieDetail(state, id){
      axios
      .get('http://localhost/REST/API/movie.php/GetMovieById?id_movie='+id)
      .then(response => (state.onemovie = response.data))
    },
    getComments (state, idmovie) {  
			axios
			.get('http://localhost/REST/API/comment.php/GetCommentByIdMovie?idmovie='+idmovie)
      .then(response => {
        state.comments = response.data
      })
		},
  },
  getters: {
    getStatusUser(state){
      return state.checkuser;
    },
    getUser(state){
      return state.user
    },
    getComments(state) {
      return state.comments;
    },
    getOneMovie(state) {
      return state.onemovie;
    },
    GetMovieEvaluate(state) {
      return state.movies.sort(function(a,b){
        if(a.evaluate < b.evaluate)
          return true
        else{
          return false
        }
      }).slice(0,12)
    },
    GetMovieNew(state) {
      return state.movies.slice(0,12)
    },
    GetMovieFilm(state) {
      return state.movies.filter(function(movie){
        return movie.type == 1
      }).slice(0,8)
    },
    GetMovieFilms(state) {
      return state.movies.filter(function(movie){
        return movie.type == 0
      }).slice(0,12)
    },
    GetMovieFilmNew(state){
      return state.movies.sort(function(a,b){
        if(a.id < b.id && a.type == 1 && b.type == 1 )
          return true
        else{
          return false
        }
      }).slice(0,6)
    }
  },
  actions: {
    createUser(context,user){
      context.commit('createUser',user);
    },
    createCatalog (context) {
      context.commit('createCatalog')
    },
    getMovie (context) {
      context.commit('getMovie')
    },
    getCountry (context) {
      context.commit('getCountry')
    },
    getMovieDetail (context, id) {
      context.commit('getMovieDetail',id)
    },
    getComments (context, id) {
      context.commit('getComments',id)
    },
  },
  
})
