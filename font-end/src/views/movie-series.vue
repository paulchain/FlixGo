<template>
   <div id="movie-seriesTemplate">
        <movieSeries></movieSeries>
        <contents></contents>
   </div>
</template>
<script>
import movieSeries from '@/components/Layout/movie/movie-series.vue'
import contents from '@/components/Layout/movie/content.vue'
export default {
    name: 'MovieSeries',
    components: {
        movieSeries,
        contents
    }
}
</script>
