import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Movie from './views/Movie.vue'
import NotFound from './views/notfound.vue'
import MovieSeries from './views/movie-series.vue'
import About from './views/about.vue'
import Pricings from './views/pricings.vue'
import Signup from './views/signup.vue'
import Signin from './views/signin.vue'


Vue.use(Router)
export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    // {
    //   path: '/movie/:id',
    //   name: 'Movie',
    //   component: Movie
    // },
    {
      path: '/movie',
      name: 'Movie',
      component: Movie
    },
    {
      path: '/notfound',
      name: 'notfound',
      component: NotFound
    },
    {
      path: '/detail/:id',
      name: 'detail',
      component: NotFound,
    },
    {
      path: '/moviemore',
      name: 'moviemore',
      component: MovieSeries
    },
    {
      path: '/about',
      name: 'about',
      component: About
    },
    {
      path: '/pricing',
      name: 'pricing',
      component: Pricings
    },
    {
      path: '/signup',
      name: 'signup',
      component: Signup
    }
    ,
    {
      path: '/signin',
      name: 'signin',
      component: Signin
    }
  ]
})
