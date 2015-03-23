var Logger, config;

Logger = require('./logger');

config = {
  terminal: true,
  file: false,
  date: false,
  time: false,
  ms: false,
  whipe: false
};

module.exports = new Logger(config);
