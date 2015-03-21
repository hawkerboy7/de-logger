var Logger, config;

config = {};

Logger = (function() {
  var check, getTime, lead, logFile, logMe, makeDateTime, makeTime, mergeRecursive, prep;

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
    return prep(arguments, '35m', 'func');
  };

  Logger.prototype.debug = function(type, msg) {
    return prep(type, msg, '34m', 'debug');
  };

  Logger.prototype.info = function(type, msg) {
    return prep(type, msg, '32m', 'info');
  };

  Logger.prototype.event = function(type, msg) {
    return prep(type, msg, '36m', 'event');
  };

  Logger.prototype.warn = function(type, msg) {
    return prep(type, msg, '33m', 'warn');
  };

  Logger.prototype.error = function(type, msg) {
    return prep(type, msg, '31m', 'error');
  };

  Logger.prototype.set = function(settings) {
    return this.error('Cannot set Properties yet :(');
  };

  check = function(name) {
    var ref;
    return config.terminal && (((ref = config[name]) != null ? ref.display : void 0) !== false);
  };

  prep = function(argumenten, color, functionName) {
    var message, name;
    console.log(argumenten);
    name = '';
    message = '';
    if (argumenten[1]) {
      name = argumenten[0];
    }
    return console.log(name);
  };

  getTime = function(name) {
    var time;
    return;
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
