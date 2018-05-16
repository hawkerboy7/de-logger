var log;

log = require('../app');

log.set({
  file: {
    enabled: true,
    name: 'test'
  },
  space: 10
});

log.info('Infor 1', 1);

log.info('Infortion 2', [1, 2, 3]);

log.info('Inf', {
  a: [1, 2, 3],
  b: '1',
  c: {
    d: 1,
    e: 'asd'
  },
  f: ['a', 'b']
});

log.error('Info', 'asdf');

log.error('Error', 'asdf2');
