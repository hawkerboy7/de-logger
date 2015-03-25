var data1, data2, log;

log = require('../server/app');

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

log.info(data1);

log.set({
  time: true,
  ms: true
});

log.event(data2);
