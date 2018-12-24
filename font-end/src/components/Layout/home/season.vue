<template>
    <section class="homes">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h1 class="home__title"><b>XẾP HẠNG PHIM</b></h1>
				</div>
				<div class="col-12">
					<carousel 
						:perPageCustom="[[720,6]]" 
						:loop = "true"
						:navigationEnabled = "true"
						:autoplay= "true"
						:speed= "3000"
						:autoplayTimeout= "5000"
						:paginationEnabled = "false  "
						class ="row"
						>
						<slide v-for="(item,index) in GetMovieNew" v-bind:key="index">
							<div class="card card--big ">
								<div class="card__cover">
									<img :src="'img/Movie/'+item.image" alt="">
									<router-link :to="'/movie/'+ item.id" >
										<a href="#" class="card__play">
											<i class="icon ion-ios-play"></i>
										</a>
									</router-link>
								</div>
								<div class="card__content">
									<h3>{{item.movie}}</h3>
									<span class="card__category">
										<a href="#">{{item.catalog}}</a>
									</span>
									<span class="card__rate"><i class="icon ion-ios-star"></i>{{item.evaluate}}</span>
								</div>
							</div>
						</slide>
					</carousel>
				</div>
			</div>
		</div>
	</section>
</template>


<script>
import { mapGetters } from 'vuex';
import { Carousel, Slide } from 'vue-carousel';
export default {
	name: 'HomeSectionItem',
	computed: {
		...mapGetters(['GetMovieNew'])
	},
	components: {
		Carousel,
		Slide
	},
}
</script>
<style lang='sass' >
	.home__carousel .card__title
		font-size: 1rem
	.homes
		padding: 0rem
		background: #19191b
	.home__title
		color: white !important
		b
			font-size: 2rem
	.card--big
		margin: 0rem .5rem
		img 
			height: 15rem
			object-fit: cover
	.VueCarousel-pagination
		li
			margin: 0 !important
	.card__content
		h3
			color: white
			font-weight: 300
</style>


