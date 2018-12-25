<template>
	<section class="section details">
		<div class="details__bg" data-bg="img/home/home__bg.jpg">
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h1 class="details__title"></h1>
				</div>
				<div class="col-12 col-xl-6">
					<div class="card card--details">				
				
						<div class="row show-more">
							<!-- card cover -->
							<div class="col-12 col-sm-4 col-md-4 col-lg-3 col-xl-5">
								<div class="card__cover">
									<img :src="'http://localhost/rest/page/public/img/' + getOneMovie.image" alt="">
								</div>
							</div>
							<div class="col-12 col-sm-8 col-md-8 col-lg-9 col-xl-7">
								<div class="card__content">
									<div class="card__wrap">
										<span class="card__rate"><i class="icon ion-ios-star"></i>{{getOneMovie.evaluate}} </span>

										<ul class="card__list">
											<li>{{getOneMovie.resolution}}</li>
											<li>{{getOneMovie.age}}</li>
										</ul>
									</div>
									<ul class="card__meta">
										<li><span>Thể loại:</span>{{getOneMovie.catalog}}</li>
										<li><span>Năm phát hành:</span> {{getOneMovie.release_year}}</li>
										<li><span>Thời gian phim:</span>{{getOneMovie.release_year}} </li>
										<li><span>Quốc gia:</span> <a href="#">{{getOneMovie.country}}</a> </li>
									</ul>
									<div   
										v-line-clamp:20="6"
										class="card__description card__description--details moreline-detail">
										{{getOneMovie.short_description}}
									</div>
								</div>
							</div>		
						</div>
					</div>
				</div>
				<!-- end content -->
				<!-- player -->
				<div class="col-12 col-xl-6">
					<videos></videos>
				</div>
			</div>
		</div>
	</section>
</template>
	
<script>
import videos from '@/components/Layout/movie/videos.vue'
import { mapGetters } from "vuex"
import { mapState } from "vuex"
export default {
	data(){
		return {
			data: 0
		}
	},
	name: 'movieDetail',
	computed: {
		...mapGetters(['getOneMovie']),
		...mapState(['onemovie']),
	},
	components: {
		videos,
	},
	beforeCreate: function(){
		// console.log('Kích function');
		
		let id = this.$route.params.id
		this.$store.dispatch('getMovieDetail',id)
		this.$store.dispatch('getComments',id)
	},
}
</script>

<style lang='sass' scoped>
	section
		padding: 2rem 0
	#player
		width: 100%
	.text-white
		color: white
	.card__cover
		height: 100%
		img
			height: 100%
			object-fit: cover
</style>