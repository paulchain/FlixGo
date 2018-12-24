<template>
  <div class="hello">
    <detailVideo></detailVideo>
    <contentVideo></contentVideo>
    <sectionPSWP></sectionPSWP>
  </div>
</template>
<script>
import detailVideo from '@/components/Layout/movie/detail.vue'
import contentVideo from '@/components/Layout/movie/contents.vue'
import sectionPSWP from '@/components/Layout/movie/pswp.vue'
export default {
  name: 'Movie',
  components: {
    detailVideo,contentVideo,sectionPSWP
  }
}
</script>
