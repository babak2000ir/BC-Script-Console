var gulp = require('gulp');
var concat = require('gulp-concat');
var cleanCss = require('gulp-clean-css');

//const ControlAddInFolder = '../';
//const ControlAddInName = 'output';

gulp.task('pack-js', function () {
    return gulp.src(['build/static/js/*.js'])
        .pipe(concat(`startupScript.js`))
        .pipe(gulp.dest(`../`));
});

gulp.task('pack-css', function () {
    return gulp.src(['build/static/css/*.css'])
        .pipe(concat(`style.css`))
        .pipe(cleanCss())
        .pipe(gulp.dest(`../`));
});

gulp.task('default', gulp.series('pack-js', 'pack-css'));