var Logger, config;

Logger = require('./logger');

config = {
  terminal: true,
  file: false,
  date: true,
  time: true,
  ms: true
};

module.exports = new Logger(config);
