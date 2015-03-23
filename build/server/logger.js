var Logger, _, config;

_ = require('underscore');

config = {};

Logger = (function() {
  var check, getDate, getMs, getTime, lead, log, logFile, prep;

  function Logger(con) {
    config = con;
  }

  Logger.prototype.clear = function() {
    var e;
    try {
      return console.log('\033c');
    } catch (_error) {
      e = _error;
      return console.log('\u001b[2J\u001b[0;0H');
    }
  };

  Logger.prototype.func = function() {
    if (!check('func')) {
      return;
    }
    return prep(arguments, '35m', 'func ');
  };

  Logger.prototype.debug = function() {
    if (!check('debug')) {
      return;
    }
    return prep(arguments, '34m', 'debug');
  };

  Logger.prototype.info = function() {
    if (!check('info')) {
      return;
    }
    return prep(arguments, '32m', 'info ');
  };

  Logger.prototype.event = function() {
    if (!check('event')) {
      return;
    }
    return prep(arguments, '36m', 'event');
  };

  Logger.prototype.warn = function() {
    if (!check('warn')) {
      return;
    }
    return prep(arguments, '33m', 'warn ');
  };

  Logger.prototype.error = function() {
    if (!check('error')) {
      return;
    }
    return prep(arguments, '31m', 'error');
  };

  Logger.prototype.set = function(settings) {
    return _.extend(config, settings);
  };

  check = function(name) {
    var ref;
    return config.terminal && (((ref = config[name]) != null ? ref.display : void 0) !== false);
  };

  prep = function(argumenten, color, functionName) {
    var message, name, set;
    set = 0;
    name = '';
    message = '';
    if (argumenten[1] && typeof argumenten[0] === 'string') {
      name = argumenten[0];
    }
    if (config.date || config.time) {
      message += '\033[30m';
    }
    if (config.date) {
      set += 1;
      message += getDate();
    }
    if (config.time) {
      if (set) {
        message += ' ';
      }
      set += 2;
      message += getTime();
    }
    if (config.time && config.ms) {
      set += 4;
      message += getMs();
    }
    if (config.date || config.time) {
      message += '\033[0m';
    }
    if (set) {
      message += '  ';
    }
    message += '\033[' + color + functionName + '\033[0m  ';
    if (name) {
      message += '\033[37m' + name + '\033[0m';
    }
    message += ' -';
    return log(name, message, argumenten);
  };

  log = function(name, message, argumenten) {
    if (name) {
      argumenten[0] = message;
    }
    console.log.apply(null, argumenten);
    if (config.file) {
      return logFile(name, message);
    }
  };

  getDate = function() {
    var time;
    time = new Date;
    return lead(time.getDate()) + '-' + lead(time.getMonth() + 1) + '-' + time.getFullYear();
  };

  getTime = function() {
    var time;
    time = new Date;
    return lead(time.getHours()) + ':' + lead(time.getMinutes()) + ':' + lead(time.getSeconds());
  };

  getMs = function() {
    var time;
    time = new Date;
    return '.' + lead(time.getMilliseconds());
  };

  lead = function(time) {
    return ('0' + time).slice(-2);
  };

  logFile = function(name, message, argumenten) {
    return console.log('Store in file');
  };

  return Logger;

})();

module.exports = Logger;
