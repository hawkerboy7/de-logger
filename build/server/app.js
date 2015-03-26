var Logger, config;

Logger = require('./logger');

config = {
  terminal: true,
  file: {
    enabled: false,
    path: 'logs',
    name: 'project-name'
  },
  date: false,
  time: false,
  ms: false,
  whipe: false,
  align: true,
  space: 0
};

module.exports = new Logger(config);
