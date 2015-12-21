var gulp = require('gulp');

// Include Our Plugins
var debug = require('gulp-debug');
var util  = require('gulp-util');
var less = require('gulp-less');
var ngAnnotate = require('gulp-ng-annotate');
var jshint = require('gulp-jshint');
var concat = require('gulp-concat');
var rename = require('gulp-rename');
var uglify = require('gulp-uglify');
var sourcemaps = require('gulp-sourcemaps');


// Define file locations & order
// * wildcards load alphabetically
var src = {
	less: [
		'less/bower_imports.less',
		'less/**/*.less'
	],
	js: [
		// ngapp.js must load before all the other stuff
		'ngapp/ngapp.js',
		'ngapp/**/*.js'
	],
	plugins: [
		// order is important here
		'bower_components/jquery/dist/jquery.min.js',
		'bower_components/bootstrap/dist/js/bootstrap.min.js',
		'bower_components/angular/angular.min.js',
		'bower_components/angular-route/angular-route.min.js',
		'bower_components/angular-resource/angular-resource.min.js',
		'bower_components/angular-animate/angular-animate.min.js'
	]
};


// Compile Our Less
gulp.task('less', function() {
	return gulp.src(src.less,{base:"./"}).pipe(debug())
		.pipe(sourcemaps.init())
			.pipe(concat('index.all.less')).pipe(debug())
			.pipe(less())
		.pipe(sourcemaps.write())
		.pipe(rename('index.css'))
		.pipe(gulp.dest('.'));
});


// Lint our Javascript
gulp.task('lint', function() {
	return gulp.src(src.js)
		.pipe(jshint())
		.pipe(jshint.reporter('default'));
});


// Concatenate & Minify JS, retaining Sourcemaps
// make it dependent on lint - purely for logging clarity
gulp.task('scripts', ['lint'], function() {
	return gulp.src(src.js,{base:"./"}).pipe(debug())
		.pipe(sourcemaps.init())
			.pipe(concat('index.all.js')).pipe(debug())
			.pipe(ngAnnotate())
			.pipe(uglify())
		.pipe(sourcemaps.write())
		.pipe(rename('index.min.js'))
		.pipe(gulp.dest('.'));
});


// Concatenate Plugin JS
// make it dependent on scripts - purely for logging clarity
gulp.task('plugins', ['scripts'], function() {
	return gulp.src(src.plugins, {base:"./"}).pipe(debug())
		.pipe(sourcemaps.init({loadMaps: true}))
			.pipe(concat('plugins.min.js')).pipe(debug())
		.pipe(sourcemaps.write())
		.pipe(gulp.dest('.'));
});


function getRelativePath(absolutePath){
	return absolutePath.replace(__dirname + '\\','');
}

// Watch Files For Changes
gulp.task('watch', function() {
	var jsWatcher = gulp.watch(src.js, ['lint', 'scripts']);
	var lessWatcher = gulp.watch(src.less, ['less']);

	// logging
	jsWatcher.on('change', function(event){
		util.log('JS ' + event.type + ': ' + util.colors.yellow(getRelativePath(event.path)));
	});
	lessWatcher.on('change', function(event){
		util.log('Less ' + event.type + ': ' + util.colors.yellow(getRelativePath(event.path)));
	});

});

gulp.task('default', ['less', 'lint', 'scripts', 'plugins', 'watch']);