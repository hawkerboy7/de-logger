var Logger, _, config;

_ = require('underscore');

config = {};

Logger = (function() {
  var getTime, lead, logFile, logMe, makeDateTime, makeTime, mergeRecursive, prep;

  function Logger(conf) {
    config = conf;
    if (!config.on) {
      return;
    }
    if (config.global.notify) {
      if (config.global.use) {
        console.log('\033[32minfo\033[0m:\t' + 'Time will be displayed the same for each function!\n');
      } else {
        console.log('\033[32minfo\033[0m:\t' + 'Time will be displayed on individual basis!\n');
      }
    }
  }

  Logger.prototype.set = function(settings) {
    return this.error('Cannot set Properties yet :(');
  };

  Logger.prototype.error = function(type, msg) {
    if (config.error.display) {
      return prep(type, msg, '31m', 'error');
    }
  };

  Logger.prototype.info = function(type, msg) {
    if (config.info.display) {
      return prep(type, msg, '32m', 'info');
    }
  };

  Logger.prototype.func = function(type, msg) {
    if (config.func.display) {
      return prep(type, msg, '34m', 'func');
    }
  };

  Logger.prototype.event = function(type, msg) {
    if (config.event.display) {
      return prep(type, msg, '36m', 'event');
    }
  };

  Logger.prototype.warn = function(type, msg) {
    if (config.warn.display) {
      return prep(type, msg, '33m', 'warn');
    }
  };

  Logger.prototype.clear = function() {
    return console.log('\u001b[2J\u001b[0;0H');
  };

  prep = function(type, msg, color, name) {
    var space, tab;
    if (!config.on) {
      return;
    }
    space = '   ';
    if (msg == null) {
      msg = space + type;
      type = '';
    } else {
      tab = '\t';
      if (type.length < 5) {
        tab = '     \t';
      }
      type = space + type + tab;
    }
    if (typeof msg === 'array' || typeof msg === 'object') {
      return logMe('\033[' + color + name + '\033[0m:\t' + getTime(name) + type, msg);
    }
    return logMe('\033[' + color + name + '\033[0m:\t' + getTime(name) + type + msg);
  };

  getTime = function(name) {
    var time;
    time = new Date;
    if (config.global.use) {
      if (!config.global.time.show) {
        return '';
      }
      if (!config.global.time.date) {
        return makeTime(time);
      }
      return makeDateTime(time);
    }
    if (!config[name].time.show) {
      return '';
    }
    if (!config[name].time.date) {
      return makeTime(time);
    }
    return makeDateTime(time);
  };

  makeTime = function(time) {
    return lead(time.getHours()) + ':' + lead(time.getMinutes()) + ':' + lead(time.getSeconds());
  };

  makeDateTime = function(time) {
    return lead(time.getDate()) + '-' + lead(time.getMonth() + 1) + '-' + lead(time.getFullYear()) + ' ' + lead(time.getHours()) + ':' + lead(time.getMinutes()) + ':' + lead(time.getSeconds()) + '.' + lead(time.getMilliseconds()) + ' ';
  };

  logMe = function(msg, obj) {
    if (!obj) {
      if (config.store) {
        logFile(msg);
      }
      if (config.terminal) {
        return console.log(msg);
      }
    } else {
      if (config.store) {
        logFile(msg, obj);
      }
      if (config.terminal) {
        return console.log(msg, obj);
      }
    }
  };

  logFile = function(msg) {
    return console.log('Store in file');
  };

  lead = function(time) {
    return ('0' + time).slice(-2);
  };

  mergeRecursive = function(obj1, obj2) {
    var e, p, results;
    results = [];
    for (p in obj2) {
      try {
        if (obj2[p].constructor === Object) {
          obj1[p] = MergeRecursive(obj1[p], obj2[p]);
        } else {
          obj1[p] = obj2[p];
        }
      } catch (_error) {
        e = _error;
        obj1[p] = obj2[p];
      }
      results.push(obj1);
    }
    return results;
  };

  return Logger;

})();

module.exports = Logger;
