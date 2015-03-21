var Logger, config;

Logger = require('./logger');

config = {
  terminal: true,
  file: false,
  time: true,
  date: true
};

module.exports = new Logger(config);
