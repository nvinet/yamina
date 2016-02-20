import express from 'express';
import path from 'path';
import logger from 'morgan';
import cookieParser from 'cookie-parser';
import bodyParser from 'body-parser';
import hbs from 'hbs';
import staticify from 'staticify';

import routes from './routes/index';
import hbsHelpers from './hbs/helpers';

const $staticify = staticify(path.join(__dirname, 'public'));
const app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');
hbs.localsAsTemplateData(app);
hbs.registerPartials(`${__dirname}/views/partials`);

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use($staticify.middleware);

hbs.registerHelper('getVersionedPath', ($path) => {
  return $staticify.getVersionedPath($path);
});

hbs.registerHelper('toUpperCase', (str) => {
  return str.toUpperCase();
});

hbs.registerHelper('toLowerCase', (str) => {
  return str.toLowerCase();
});

hbs.registerHelper("foreach",function(arr,options) {
  if(options.inverse && !arr.length)
    return options.inverse(this);

  return arr.map(function(item,index) {
    item.$index = index;
    item.$first = index === 0;
    item.$last  = index === arr.length-1;
    return options.fn(item);
  }).join('');
});

app.use('/', routes);

// catch 404 and forward to error handler
app.use((req, res, next) => {
  const err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use((err, req, res) => {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use((err, req, res) => {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
});

export default app;
