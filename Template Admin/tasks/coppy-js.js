module.exports = function (gulp, $, browserSync) {
	gulp.task('copy-ckeditor', function () {
		return gulp.src([
				'./bower_components/ckeditor/**/**.*',
			])
			.pipe(gulp.dest('./dist/ckeditor'));
	});
};
