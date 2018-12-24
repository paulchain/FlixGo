<template>
  <div id="app">
    <Header></Header>

      <router-view/>
    <Footer></Footer>
    <div id="videobottom">
    </div>
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
  methods: {
    scrolltop(){
			window.scrollTo(0,0);
		},
  }
}
</script>
<style lang="sass" scoped>
  .content__head
    &:before
      background-image: linear-gradient(90deg, #cacaca 0%, #ffffff 100%) !important
  #videobottom
    position: fixed
    bottom: 0
    right: 0
    z-index: 1000
</style>

