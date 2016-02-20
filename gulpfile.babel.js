// generated on 2015-09-12 using generator-gulp-webapp 1.0.3
/* eslint-disable no-console, no-inline-comments */
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import browserSync from 'browser-sync';
import del from 'del';
import babel from 'gulp-babel';

const $ = gulpLoadPlugins();
const reload = browserSync.reload;
const dirs = {
  src: 'src',
  styles: 'src/styles',
  scripts: 'src/scripts',
  images: 'src/images',
  ico: 'src/ico',
  fonts: 'src/fonts',
  vendorJs: 'src/scripts/vendor',
  vendorCss: 'src/styles/vendor',
  dest: 'app/public',
  bower: './bower_components'
};

gulp.task('sass', () => {
  return gulp.src(`${dirs.styles}/*.scss`)
    .pipe($.plumber())
    .pipe($.sass.sync({
      outputStyle: 'expanded',
      precision: 10,
      includePaths: ['.']
    }).on('error', $.sass.logError))
    .pipe($.autoprefixer({browsers: ['last 1 version']}))
    .pipe(gulp.dest('.tmp/styles'))
    .pipe(reload({stream: true}));
});

gulp.task('styles:plugins', () => {
  return gulp.src([
      `${dirs.vendorCss}/bootstrap.min.css`,
      `${dirs.vendorCss}/bootstrap-responsive.min.css`
    ])
    .pipe($.concat('plugins.css'))
    .pipe(gulp.dest(`./${dirs.dest}/styles/`));
});

gulp.task('styles', () => {
  return gulp.src([
      `${dirs.styles}/application.css`
    ])
    .pipe($.concat('main.css'))
    .pipe(gulp.dest(`./${dirs.dest}/styles/`));
});

gulp.task('lint', () => {
  return gulp.src([
      `${dirs.scripts}/**/*.js`,
      `!${dirs.vendorJs}/**/*.js`
    ])
    .pipe(reload({stream: true, once: true}))
    .pipe($.eslint())
    .pipe($.eslint.format())
    .pipe($.if(!browserSync.active, $.eslint.failAfterError()));
});

gulp.task('scripts:vendor', () => {
  return gulp.src([
      `${dirs.bower}/jquery/jquery.min.js`
    ])
    .pipe($.concat('vendor.js'))
    .pipe(gulp.dest(`./${dirs.dest}/scripts/`));
});

gulp.task('scripts:plugins', () => {
  return gulp.src([
      `${dirs.vendorJs}/bootstrap.min.js`
    ])
    .pipe($.concat('plugins.js'))
    .pipe(gulp.dest(`./${dirs.dest}/scripts/`));
});

gulp.task('scripts:main', () => {
  return gulp.src([
      `${dirs.vendorJs}/scripts.js`
    ])
    .pipe(babel({
      presets: ['es2015']
    }))
    .pipe($.concat('main.js'))
    .pipe($.uglify({compress: false})) // TODO fix the compression
    .pipe(gulp.dest(`./${dirs.dest}/scripts/`));
});

gulp.task('images', () => {
  return gulp.src(`${dirs.images}/**/*`)
    .pipe($.if($.if.isFile, $.cache($.imagemin({
        progressive: true,
        interlaced: true,
        // don't remove IDs from SVGs, they are often used
        // as hooks for embedding and styling
        svgoPlugins: [{cleanupIDs: false}]
      }))
      .on('error', function (err) {
        console.log(err);
        this.end();
      })))
    .pipe(gulp.dest(`./${dirs.dest}/images`));
});

gulp.task('ico', () => {
  return gulp.src(`${dirs.ico}/**/*`)
    .pipe($.if($.if.isFile, $.cache($.imagemin({
        progressive: true,
        interlaced: true,
        // don't remove IDs from SVGs, they are often used
        // as hooks for embedding and styling
        svgoPlugins: [{cleanupIDs: false}]
      }))
      .on('error', function (err) {
        console.log(err);
        this.end();
      })))
    .pipe(gulp.dest(`./${dirs.dest}/ico`));
});

gulp.task('fonts', () => {
  return gulp.src(require('main-bower-files')({
      filter: '**/*.{eot,svg,ttf,woff,woff2}'
    }).concat(`${dirs.fonts}/**/*`))
    .pipe(gulp.dest('.tmp/fonts'))
    .pipe(gulp.dest(`./${dirs.dest}/fonts`));
});

gulp.task('extras', () => {
  return gulp.src([
    'src/*.*',
    '!src/*.html'
  ], {
    dot: true
  }).pipe(gulp.dest(dirs.dest));
});

gulp.task('clean', del.bind(null, ['.tmp', dirs.dest]));

gulp.task('serve', ['styles', 'fonts'], () => {
  browserSync({
    notify: false,
    port: 9000,
    server: {
      baseDir: ['.tmp', 'app'],
      routes: {
        '/bower_components': 'bower_components'
      }
    }
  });

  gulp.watch([
    `${dirs.scripts}/**/*.js`,
    `${dirs.images}/**/*`,
    '.tmp/fonts/**/*'
  ]).on('change', reload);

  gulp.watch(`${dirs.styles}/**/*.scss`, ['styles']);
  gulp.watch('src/fonts/**/*', ['fonts']);
});

gulp.task('serve:public', () => {
  browserSync({
    notify: false,
    port: 9000,
    server: {
      baseDir: ['public']
    }
  });
});


gulp.task('build', [
  'lint',
  'scripts:vendor',
  'scripts:plugins',
  'scripts:main',
  'styles:plugins',
  'styles',
  'images',
  'ico',
  'fonts',
  'extras'
], () => {
  return gulp.src(`${dirs.dest}/**/*`).pipe($.size({title: 'build', gzip: true}));
});

gulp.task('default', ['clean'], () => {
  gulp.start('build');
});
