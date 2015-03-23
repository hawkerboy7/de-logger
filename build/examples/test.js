var log;

log = require('../server/app');

log.set({
  date: true,
  whipe: true
});

log.clear();

log.func('func', {
  a: 1
});

log.debug('debug', {
  a: 1
}, {
  b: 2
});

log.info('info', 'info', [1, 2, 3, 4]);

log.event('event', 'event', 'event');

log.warn('warn', 'warn', 'warn', 'warn');

log.error('error', 'error', 'error', 'error', 'error');

log.set({
  date: false,
  func: {
    display: false
  },
  debug: {
    display: false
  }
});

log.func('func', {
  a: 1
});

log.debug('debug', {
  a: 1
}, {
  b: 2
});

log.info('info hoi hoi');

log.event('event');

log.warn('warn', 'warn', 'warn', 'warn');

log.error('error', 'error', 'error', 'error', 'error');
