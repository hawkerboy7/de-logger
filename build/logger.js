(function() {
  var Logger, _, config, file, self, stream, time;

  _ = require('underscore');

  file = require('./file');

  time = require('./time');

  self = null;

  config = null;

  stream = null;

  Logger = (function() {
    var check, deepMerge, log, prep;

    function Logger(con) {
      config = con;
      self = this;
    }

    Logger.prototype.clear = function() {
      if (config.whipe) {
        return console.log('\033c');
      } else {
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
      deepMerge(config, settings);
      if (config.file.enabled) {
        return file.build(config);
      }
    };

    check = function(name) {
      var ref;
      return (config.terminal || config.file.enabled) && (((ref = config[name]) != null ? ref.display : void 0) !== false);
    };

    prep = function(argumenten, color, functionName) {
      var i, inputs, length, message, name, set;
      inputs = _.extend({}, argumenten);
      if (!argumenten[0]) {
        return;
      }
      set = 0;
      name = '';
      message = '';
      if (!!(argumenten[1] && typeof argumenten[0] === 'string')) {
        name = argumenten[0];
      }
      if (config.date || config.time) {
        message += '\033[30m';
      }
      if (config.date) {
        set += 1;
        message += time.getDate();
      }
      if (config.time) {
        if (set) {
          message += ' ';
        }
        set += 2;
        message += time.getTime();
      }
      if (config.time && config.ms) {
        set += 4;
        message += time.getMs();
      }
      if (config.date || config.time) {
        message += '\033[0m';
      }
      if (set) {
        message += '  ';
      }
      message += '\033[' + color + functionName + '\033[0m';
      if (name) {
        message += ' \033[0m' + name + '\033[037m';
        if (config.align) {
          length = name.length;
          if (length > config.space) {
            config.space = length;
          }
          i = 0;
          while (i < (config.space - length)) {
            message += ' ';
            i++;
          }
        }
      }
      if (name) {
        message += ' → ';
      }
      return log(name, message, argumenten, inputs, functionName);
    };

    log = function(name, message, argumenten, inputs, functionName) {
      var result;
      result = [];
      if (!name) {
        result.push(message);
        result.push(argumenten[0]);
      } else {
        argumenten[0] = message;
        _.each(argumenten, (function(_this) {
          return function(argument) {
            return result.push(argument);
          };
        })(this));
      }
      result.push('\033[0m');
      console.log.apply(null, result);
      if (!file.disabled && config.file.enabled) {
        return file.log(name, functionName, inputs);
      }
    };

    deepMerge = function(obj1, obj2) {
      var e, p;
      for (p in obj2) {
        try {
          if (typeof obj2[p] === 'object') {
            obj1[p] = deepMerge(obj1[p], obj2[p]);
          } else {
            obj1[p] = obj2[p];
          }
        } catch (_error) {
          e = _error;
          obj1[p] = obj2[p];
        }
      }
      return obj1;
    };

    return Logger;

  })();

  module.exports = Logger;

}).call(this);
