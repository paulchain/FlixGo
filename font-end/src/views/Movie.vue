<template>
  <div class="hello">
    <detailVideo></detailVideo>
    <contentVideo></contentVideo>
    <sectionPSWP></sectionPSWP>
  </div>
</template>

<script>
import detailVideo from '@/components/about/detail.vue'
import contentVideo from '@/components/about/content.vue'
import sectionPSWP from '@/components/about/pswp.vue'
export default {
  name: 'Movie',
  components: {
    detailVideo,contentVideo,sectionPSWP
  }
}
</script>
