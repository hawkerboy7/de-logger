var File, _, config, folderPath, fs, messagesBuffer, path, stream, time;

_ = require('underscore');

fs = require('fs');

path = require('path');

time = require('./time');

config = null;

stream = null;

folderPath = null;

messagesBuffer = false;

File = (function() {
  var createFolder, createStream, handle, logMessagesBuffer, makeNext, writeMessage;

  function File() {}

  File.prototype.build = function(cfg) {
    config = cfg;
    if (!config.file) {
      return;
    }
    return createFolder(function(e) {
      var disabled;
      if (e) {
        return disabled = true;
      }
      return createStream(function(e) {
        if (e) {
          return disabled = true;
        }
        return logMessagesBuffer();
      });
    });
  };

  File.prototype.log = function() {
    var message;
    if (!stream) {
      if (!messagesBuffer) {
        messagesBuffer = [];
      }
      message = handle(arguments);
      return messagesBuffer.push(message);
    } else {
      message = handle(arguments);
      return writeMessage(message);
    }
  };

  createFolder = function(cb) {
    var dirPath, folders, i, pointer;
    pointer = __dirname + '/../../../..';
    folders = config.file.path.split("/");
    dirPath = pointer;
    i = 0;
    return makeNext(folders, dirPath, i, cb);
  };

  makeNext = function(folders, dirPath, i, cb) {
    dirPath += '/' + folders[i];
    folderPath = path.resolve(dirPath);
    return fs.mkdir(folderPath, function(e) {
      if (e && e.code !== 'EEXIST') {
        cb(e);
      }
      if ((folders.length - 1) === i) {
        return cb(null);
      } else {
        i++;
        return makeNext(folders, dirPath, i, cb);
      }
    });
  };

  createStream = function(cb) {
    var e, filePath, name;
    name = time.getDate(true) + ' ' + time.getTime() + time.getMs() + ' ' + config.file.name;
    filePath = folderPath + '/' + name + '.txt';
    try {
      stream = fs.createWriteStream(filePath);
    } catch (_error) {
      e = _error;
      cb(e);
    }
    return cb(null);
  };

  logMessagesBuffer = function() {
    return _.each(messagesBuffer, function(message) {
      return writeMessage(message);
    });
  };

  handle = function(argumenten) {
    var args, functionName, message, name;
    name = argumenten[0];
    functionName = argumenten[1];
    args = argumenten[2];
    message = time.getDate(true) + ' ' + time.getTime() + time.getMs();
    message += '  ' + functionName;
    if (name) {
      message += ' ' + name + ' →';
    }
    _.each(args, function(arg, i) {
      if (name) {
        if (i === '0') {
          return;
        }
      }
      if (typeof arg === 'object') {
        return message += ' ' + JSON.stringify(arg);
      }
      return message += ' ' + arg;
    });
    return message;
  };

  writeMessage = function(message) {
    return stream.write(message + '\n');
  };

  return File;

})();

module.exports = new File;
