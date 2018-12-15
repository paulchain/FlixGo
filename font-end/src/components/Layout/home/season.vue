<template>
    <section class="homes">
		<!-- home bg -->
		<div class="owl-carousel home__bg">
			<div class="item home__cover" data-bg="img/home/home__bg.jpg"></div>
			<div class="item home__cover" data-bg="img/home/home__bg2.jpg"></div>
			<div class="item home__cover" data-bg="img/home/home__bg3.jpg"></div>
			<div class="item home__cover" data-bg="img/home/home__bg4.jpg"></div>
		</div>
		<!-- end home bg -->
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h1 class="home__title"><b>XẾP HẠNG PHIM</b></h1>
					<button class="home__nav home__nav--prev" type="button">
						<i class="icon ion-ios-arrow-round-back"></i>
					</button>
					<button class="home__nav home__nav--next" type="button">
						<i class="icon ion-ios-arrow-round-forward"></i>
					</button>
				</div>
				<div class="col-12">
					<div class="owl-carousel home__carousel">
						<div v-for='(item,index) in getMovie' v-bind:key='index' class="item">
							<router-link :to="'/movie/'+ item.id">
								<div class="card card--big">
									<div class="card__cover">
										<img :src="'img/Movie/'+item.image" alt="">
										<a href="#" class="card__play">
											<i class="icon ion-ios-play"></i>
										</a>
									</div>
									<div class="card__content">
										<h3>{{item.movie}}</h3>
										<span class="card__category">
											<a href="#">{{item.catalog}}</a>
										</span>
										<span class="card__rate"><i class="icon ion-ios-star"></i>{{item.evaluate}}</span>
									</div>
								</div>
							</router-link> |
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</template>


<script>
import { mapGetters } from 'vuex'
export default {
	name: 'HomeSectionItem',
	computed: {
		getMovie(){
			return this.$store.state.movies
		}
	},
	actions: {
		...mapGetters

	}
}
</script>
<style>
	.home__carousel .card__title{
		font-size: 1rem
	}
	.homes{
		padding: 2rem 0rem
	}
	.home__title{
		color: white !important
	}
</style>


