var Logger, config;

Logger = require('./logger');

config = {
  terminal: true,
  file: {
    path: 'logs/hallo/test/kan/dot/wel',
    name: 'project-log',
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
