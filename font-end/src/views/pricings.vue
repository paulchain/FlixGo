<template>
  <div class="content">
    <pricing></pricing>
    <choosePlan></choosePlan>
    <ourFeatures></ourFeatures>
    <partners></partners>
  </div>
</template>

<script>
// @ is an alias to /src
import pricing from '@/components/Layout/pricings/pricing.vue'
import choosePlan from '@/components/Layout/pricings/choosePlan.vue'
import ourFeatures from '@/components/Layout/pricings/ourFeatures.vue'
import partners from '@/components/Layout/home/partners.vue'
export default {
  name: 'Pricings',
  components: {
    pricing, choosePlan, ourFeatures, partners
  }
}
</script>
