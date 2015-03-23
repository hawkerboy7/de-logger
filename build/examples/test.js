var log;

log = require('../server/app');

log.set({
  date: true,
  whipe: true
});

log.clear();

log.info('name_smal', 'data');

log.info('name_bigger', 'data');

log.info('name', 'data');

log.info('name_12', 'data');

log.info('name_even_bigger', 'data');

log.info('name_normal', 'data');

log.info('name', 'data');
