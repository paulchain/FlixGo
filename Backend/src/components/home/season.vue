<template>
    <section class="homes">
		<!-- home bg -->
		<!-- <div class="owl-carousel home__bg">
			<div class="item home__cover" data-bg="img/home/home__bg.jpg"></div>
			<div class="item home__cover" data-bg="img/home/home__bg2.jpg"></div>
			<div class="item home__cover" data-bg="img/home/home__bg3.jpg"></div>
			<div class="item home__cover" data-bg="img/home/home__bg4.jpg"></div>
		</div> -->
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
						<div v-for='(item,index) in GetMovieEvaluate' v-bind:key='index' class="item">
							<!-- card -->
							<div class="card card--big">
								<div class="card__cover">
									<img :src="'img/Movie/'+item.images" alt="">
									<a href="#" class="card__play">
										<i class="icon ion-ios-play"></i>
									</a>
								</div>
								<div class="card__content">
									<h3 class="card__title" :title='item.name_movie'><a href="#">{{item.name_movie}}</a></h3>
									<span class="card__category">
										<a href="#">Action</a>
										<a href="#">Triler</a>
									</span>
									<span class="card__rate"><i class="icon ion-ios-star"></i>8.4</span>
								</div>
							</div>
							<!-- end card -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</template>


<script>
import {mapGetters} from 'vuex'
export default {
	name: 'HomeSectionItem',
	computed: {
		...mapGetters(['GetMovieEvaluate'])
	},
	created() {
		this.$store.dispatch('getMovie')
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
</style>


