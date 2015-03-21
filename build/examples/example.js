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

log.func('1', 2, [3], {
  a: 4
});

log.func('Object', {
  a: 4
});
