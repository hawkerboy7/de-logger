var File, _, config, file, fs, path, self;

_ = require('underscore');

fs = require('fs');

path = require('path');

self = null;

file = null;

config = null;

File = (function() {
  var createFolder, createStream, makeNext;

  function File() {}

  File.prototype.build = function(cfg) {
    config = cfg;
    self = this;
    if (!config.file) {
      return;
    }
    return createFolder(function(status) {
      var disabled;
      if (status) {
        return disabled = true;
      }
      return createStream(function(res) {
        return console.log('stream', res);
      });
    });
  };

  File.prototype.log = function() {};

  createFolder = function(cb) {
    var dirPath, folders, i, pointer;
    pointer = __dirname + '/../..';
    folders = config.file.path.split("/");
    dirPath = pointer;
    i = 0;
    return makeNext(folders, dirPath, i, cb);
  };

  makeNext = function(folders, dirPath, i, cb) {
    var folderPath;
    dirPath += '/' + folders[i];
    folderPath = path.resolve(dirPath);
    return fs.mkdir(folderPath, function(e) {
      if (e && e.code !== 'EEXIST') {
        cb(false);
      }
      if ((folders.length - 1) === i) {
        return cb(true);
      } else {
        i++;
        return makeNext(folders, dirPath, i, cb);
      }
    });
  };

  createStream = function() {
    return console.log('createStream');
  };

  return File;

})();

module.exports = new File;
