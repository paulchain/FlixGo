<template>
    <section class='sliderHome detail '>
        <!-- FORM HANDLE FILE -->
        <!-- <div class='demo'>
            <form action="" enctype="multipart/form-data" >
                <input id='file' @change="LoadImage" ref='file' type="file">
                <label for="file">Nhập file</label>
            </form>
        </div> -->
        <!-- <img v-bind:src='image' alt=""> -->

        <Carousel 
        :perPageCustom="[[720,1]]"
        :loop= "false"
        :autoplay= "true"
        :speed= "3000"
        :autoplayTimeout= "5000"
        :minSwipeDistance= "12"

        >
            <Slide>
                <figure class='item '>
                    <img  class='bg-items' src="img/home/home__bg2.jpg" alt="">
                    <img   class='show-items' src="img/home/home__bg2.jpg" alt="">
                    <figcaption>
                        <p>Tên Phim</p>
                        <small>Mô tả nhỏ</small>
                    </figcaption>
                </figure>
            </Slide>
            <Slide>
                <figure class='item '>
                    <img  class='bg-items' src="img/home/home__bg3.jpg" alt="">
                    <img   class='show-items' src="img/home/home__bg3.jpg" alt="">
                    <figcaption>
                        <p>Tên Phim</p>
                        <small>Mô tả nhỏ</small>
                    </figcaption>
                </figure>
            </Slide>
            <Slide>
                <figure class='item '>
                    <img  class='bg-items' src="img/home/home__bg4.jpg" alt="">
                    <img  class='show-items' src="img/home/home__bg4.jpg" alt="">
                    <figcaption>
                        <p>Tên Phim</p>
                        <small>Mô tả nhỏ</small>
                    </figcaption>
                </figure>
            </Slide>
        </Carousel>
    </section>
</template>
<script>
import { Carousel, Slide } from 'vue-carousel';
export default {
    name: 'sliderHome',
    data(){
        return {
            image: null
        }
    },
    components: {
        Slide,
        Carousel
    }

}
</script>

<style lang="sass">

    .sliderHome
        position: relative
        .item
            position: relative
            padding: 0
            margin-bottom: 0
            img
                width: 100%
            .bg-items
                width: 100%
                hieght: 100%
                position: absolute
                top: 0
                left: 0
                z-index: 0
                -webkit-filter: blur(2px)
                filter: blur(2px)
                opacity: .4
            .show-items
                max-height: 70vh
                object-fit: cover
                position: relative
                z-index: 1
                border-radius: 3px
            figcaption
                text-align: center
                position: absolute
                bottom: 2rem 
                width: 100%
                z-index: 2
                color: white
                padding-bottom: 1rem
                p
                    font:
                        weight: 400
                        size: 2rem
                small
                    font-size: 1.3rem
                
        .owl-dots
            position: absolute
            bottom: 0
            display: flex
            justify-content: center
            width: 100%
            button 
                background: #fb6d1a3b
                width: 15px 
                height: 15px 
                border-radius: 50%
                margin: .4rem
                border: 1px solid #ff23002b
</style>
