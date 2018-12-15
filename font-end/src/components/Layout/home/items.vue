<template>
    <section class="content">
		<div class="content__head">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<!-- content title -->
						<h2 class="content__title">PHIM ĐƯỢC ĐÁNH GIÁ CAO</h2>
						<!-- end content title -->
						<!-- content tabs nav -->
						<ul class="nav nav-tabs content__tabs" id="content__tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1" aria-selected="true">PHIM LẺ</a>
							</li>

							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2" aria-selected="false">PHIM BỘ</a>
							</li>

							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3" aria-selected="false">PHIM HOẠT</a>
							</li>	
						</ul>
						<!-- end content tabs nav -->

						<!-- content mobile tabs nav -->
						<div class="content__mobile-tabs" id="content__mobile-tabs">
							<div class="content__mobile-tabs-btn dropdown-toggle" role="navigation" id="mobile-tabs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<input type="button" value="New items">
								<span></span>
							</div>

							<!-- <div class="content__mobile-tabs-menu dropdown-menu" aria-labelledby="mobile-tabs">
								<ul class="nav nav-tabs" role="tablist">
									<li class="nav-item"><a class="nav-link active" id="1-tab" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1" aria-selected="true">PHIM LẼ MỚI</a></li>

									<li class="nav-item"><a class="nav-link" id="2-tab" data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2" aria-selected="false">PHIM BỘ MỚI</a></li>

									<li class="nav-item"><a class="nav-link" id="3-tab" data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3" aria-selected="false">PHIM CHIẾU RẠP</a></li>

									<li class="nav-item"><a class="nav-link" id="4-tab" data-toggle="tab" href="#tab-4" role="tab" aria-controls="tab-4" aria-selected="false">PHIM HOẠT HÌNH</a></li>
								</ul>
							</div> -->
						</div>
						<!-- end content mobile tabs nav -->
					</div>
				</div>
			</div>
		</div>
        <div class="container">
			<!-- content tabs -->
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="1-tab">
					<div class="row">
						<div class="col-6 col-sm-12 col-lg-6" v-for="(item,index) in GetMovieFilm" v-bind:key='index'>
							<div class="card card--list">
								<div class="row">
									<div class="col-12 col-sm-4">
										<div class="card__cover">
											<img :src="'img/Movie/'+item.image" alt="">
											<a href="#" class="card__play">
												<i class="icon ion-ios-play"></i>
											</a>
										</div>
									</div>
									<div class="col-12 col-sm-8">
										<div class="card__content">
											<h3 class="card__title"><a href="#">{{item.movie}}</a></h3>
											<span class="card__category">
												<a href="#">{{item.catalog}}</a>
											</span>

											<div class="card__wrap">
												<span class="card__rate"><i class="icon ion-ios-star"></i>{{item.evaluate}}</span>

												<ul class="card__list">
													<li>{{item.resolution}}</li>
													<li>{{item.age}} + </li>
												</ul>
											</div>

											<div class="card__description">
												<p>{{item.short_description}}</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>	
					</div>	
				</div>

				<div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="2-tab">
					<div class="row">
						<!-- card -->
						<div class="col-6 col-sm-4 col-lg-3 col-xl-2"  v-for="(item,index) in GetMovieFilms" v-bind:key='index'>
							<div class="card">
								<div class="card__cover">
									<img src="img/covers/cover.jpg" alt="">
									<a href="#" class="card__play">
										<i class="icon ion-ios-play"></i>
									</a>
								</div>
								<div class="card__content">
									<h3 class="card__title"><a href="#">{{item.movie}}</a></h3>
									<span class="card__category">
										<a href="#">{{item.catalogy}}</a>
									</span>
									<span class="card__rate"><i class="icon ion-ios-star"></i>{{item.evaluate}}</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="tab-3" role="tabpanel" aria-labelledby="3-tab">
					<div class="row">
						<!-- card -->
						<div class="col-6 col-sm-4 col-lg-3 col-xl-2" v-for='(item,index) in GetMovieFilm' v-bind:key="index">
							<div class="card">
								<div class="card__cover">
									<img :src="'img/Movie/'+item.image" alt="">
									<a href="#" class="card__play">
										<i class="icon ion-ios-play"></i>
									</a>
								</div>
								<div class="card__content">
									<h3 class="card__title"><a href="#">{{item.movie}}</a></h3>
									<span class="card__category">
										<a href="#">{{item.catalog}}</a>
									</span>
									<span class="card__rate"><i class="icon ion-ios-star"></i>{{item.evaluate}}</span>
								</div>
							</div>
						</div>
						<!-- end card -->
					</div>
				</div>
				
			</div>
			<!-- end content tabs -->
		</div>
    </section>
</template>
<script>
import {mapGetters} from 'vuex'
export default {
	name: 'Item',
	computed:{
		...mapGetters(['GetMovieNew','GetMovieFilm','GetMovieFilms'])
	}

}
</script>

<style lang="sass" scoped>
	.content__title
		color: white !important
	.card__title
		padding: 10px 0px
			
</style>
