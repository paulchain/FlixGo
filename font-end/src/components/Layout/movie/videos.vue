<template>
    <div id="video">
        <transition v-show="checkvideos" >
            <vue-plyr >
                <video class='videoPlayer' poster="poster.png" src="video.mp4">
                    <!-- <source src="video-720p.mp4" type="video/mp4" size="720"> -->
                    <!-- <source src="" type="video/mp4" size="1080"> -->
                    <!-- <source src="https://r6---sn-i3b7kn7s.googlevideo.com/videoplayback?id=fb3efc54d0d19055&itag=18&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7kn7s&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=pxEfXIPZKMS34AKTwoGAAQ&susc=drp&app=fife&driveid=1pB8Z6Jg_6QOefsTEBLe34RzBLvwkp-b9&mime=video/mp4&dur=463.307&lmt=1545399472458273&mt=1545539374&ip=2001:ee0:305:1::14&ipbits=48&expire=1545547207&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,sc,ttl,ei,susc,app,driveid,mime,dur,lmt&signature=5EAFFA1DBB773BC9D67442610A98297210F1F224E861806B889BCDD39A12C80D.E54277318E4AD130DF9B4C39F371531F111207E7BE3954BD44D4DC6A9D68DB8C&key=us0" type="video/mp4" size="576"> -->
                    <!-- <track kind="captions" label="English" srclang="en" src="captions-en.vtt" default> -->
                </video>
            </vue-plyr>
       </transition>
    </div>
</template>

<script>
export default {
    name: "videos",
    data(){
        return {
            checkvideos: true,
        }
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


