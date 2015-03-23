var data1, data2, log;

log = require('../server/app');

log.set({
  whipe: true
});

log.clear();

data1 = {
  a: 1,
  b: 2,
  c: 3
};

data2 = {
  a: 4,
  b: 5,
  c: 6
};

log.func('First function');

log.debug('Debugging', 'Debug message', data1);

log.set({
  time: true,
  func: {
    display: false
  },
  debug: {
    display: false
  }
});

log.func('First function');

log.debug('Debugging', 'Debug message', data1);

log.info('Webserver', 'Running at port: 8000');

log.event('Gui input', data2);

log.set({
  date: true,
  func: {
    display: false
  },
  debug: {
    display: false
  }
});

log.warn('Usermodel', 'Cannot find a user id');

log.error('Mongodb', 'Connection with mongodb couldn\'t be established');

log.set({
  time: false
});

log.info(data1);

log.set({
  time: true,
  ms: true
});

log.event(data2);
