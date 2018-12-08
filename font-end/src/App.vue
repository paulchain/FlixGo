<template>
  <div id="app">
    <Header></Header>
    <!-- <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link>
    </div> -->
   
    <router-view/>
    <Footer></Footer>
  </div>
</template>

<script>
import Header from '@/components/Layout/Header.vue'
import Footer from '@/components/Layout/Footer.vue'
export default {
  name: 'App',
  components: {
    Header,Footer
  },
}
</script>
