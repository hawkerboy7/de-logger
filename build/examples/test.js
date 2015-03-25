var log, port;

log = require('../server/app');

log.set({
  date: true,
  whipe: true
});

log.clear();

port = 8000;

log.info('Name', 'Running at port:', port);
