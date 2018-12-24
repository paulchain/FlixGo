import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Movie from './views/Movie.vue'
import NotFound from './views/notfound.vue'
import About from './views/about.vue'
import Pricings from './views/pricings.vue'
import Signup from './views/signup.vue'
import Signin from './views/signin.vue'
import Video from './views/videos.vue'


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
    {
      path: '/movie/:id',
      name: 'Movie',
      component: Movie
    },
    {
      path: '/video',
      name: 'video',
      component: Video
    },
    {
      path: '/notfound',
      name: 'notfound',
      component: NotFound
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
