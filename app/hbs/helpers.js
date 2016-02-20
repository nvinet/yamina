import hbs from 'hbs';
import path from 'path';
import staticify from 'staticify';

const hbsHelper = () => {
  const $staticify = staticify(path.join(__dirname, 'public'));
  hbs.registerHelper('getVersionedPath', ($path) => {
    return $staticify.getVersionedPath($path);
  });

  hbs.registerHelper('toUpperCase', (str) => {
    return str.toUpperCase();
  });
};

export default hbsHelper;
