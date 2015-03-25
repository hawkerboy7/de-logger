var Logger, config;

Logger = require('./logger');

config = {
  terminal: true,
  file: {
    path: 'logs/kan/dit/ook/nog',
    name: 'project-name',
    date: true
  },
  date: false,
  time: false,
  ms: false,
  whipe: false,
  align: true,
  space: 0
};

module.exports = new Logger(config);
