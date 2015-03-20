var Logger, config;

Logger = require('./logger');

config = {
  on: true,
  terminal: true,
  store: false,
  global: {
    use: true,
    notify: false,
    time: {
      show: false,
      date: false
    }
  },
  error: {
    display: true,
    time: {
      show: true,
      date: false
    }
  },
  info: {
    display: true,
    time: {
      show: true,
      date: false
    }
  },
  func: {
    display: true,
    time: {
      show: true,
      date: false
    }
  },
  event: {
    display: true,
    time: {
      show: true,
      date: false
    }
  },
  warn: {
    display: true,
    time: {
      show: true,
      date: false
    }
  }
};

module.exports = new Logger(config);
