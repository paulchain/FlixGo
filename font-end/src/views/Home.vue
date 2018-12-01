<template>
  <div class="content">
    <slider></slider>
    <season></season>
    <items></items>
    <premiere></premiere>
    <partners></partners>
  </div>
</template>

<script>
// @ is an alias to /src
import slider from '@/components/home/slider.vue'
import season from '@/components/home/season.vue'
import items from '@/components/home/items.vue'
import premiere from '@/components/home/premiere.vue'
import partners from '@/components/home/partners.vue'
export default {
  name: 'Home',
  components: {
    season, items, premiere,partners,slider
  }
}
</script>

<style>
</style>
