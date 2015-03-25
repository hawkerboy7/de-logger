var config, log;

log = require('de-logger');

config = {
  ms: false,
  date: false,
  time: false,
  align: true,
  space: 0,
  whipe: false,
  terminal: true
};

log.set(config);
