var data1, data2, data3, log;

log = require('../server/app');

data1 = '{"a":"1","b":"2","c":"3"}';

data2 = {
  a: 1,
  b: 2,
  c: 3
};

data3 = [1, 2, 3];

log.clear();

log.func('func', {
  a: 3,
  b: 3
}, [1, 2, 3, 4]);

log.debug('debug', {
  a: 3
}, {
  b: 3
});

log.info('info', {
  a: 3,
  b: 3
});

log.event('event', 'event', 'event');

log.warn('warn', 'warn', 'warn');

log.error('error1', 'error2', 'error3', 'error4', 'error5', 'error6');
