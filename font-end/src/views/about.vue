<template>
    <div id="about">
        <aboutUs></aboutUs>
        <flixGo></flixGo>
        <partners></partners>
    </div>
</template>
<script>
import aboutUs from '@/components/Layout/about/aboutus.vue'
import flixGo from '@/components/Layout/about/flixgo.vue'
import partners from '@/components/Layout/home/partners.vue'
export default {
    name: 'About',
    components: {
        aboutUs, flixGo,partners
    }
}
</script>
