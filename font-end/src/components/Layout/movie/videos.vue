<template>
    <div id="video">
        <transition v-show="checkvideos" >
            <vue-plyr >
                <video class='videoPlayer' poster="poster.png" src="video.mp4">
                    <source :src="getOneMovie.clip_SD" type="video/mp4" size="576">
                    <!-- <source :src="getOneMovie.clip_HD" type="video/mp4" size="720"> -->
                    <!-- <source :src="getOneMovie.clip_FHD" type="video/mp4" size="1080"> -->
                    <!-- <track kind="captions" label="English" srclang="en" src="captions-en.vtt" default> -->
                </video>
            </vue-plyr>
       </transition>
    </div>
</template>

<script>
import { mapGetters } from "vuex"
export default {
    name: "videos",
    data(){
        return {
            checkvideos: true,
        }
    },
    computed: {
        ...mapGetters(['getOneMovie'])
    },
    methods: {
        demo(){
            
            this.checkvideos = false
        }
    },
    created(){
        
    },
   
}
</script>
<style lang="sass" scoped>
    .plyr__poster
        border: 5px solid 
</style>


