var File, _, config, file, fs, path, self;

_ = require('underscore');

fs = require('fs');

path = require('path');

self = null;

file = null;

config = null;

File = (function() {
  var createFolder, makeStream;

  function File() {}

  File.prototype.build = function(cfg) {
    config = cfg;
    self = this;
    if (!config.file) {
      return;
    }
    return createFolder(function(status) {
      return console.log('status', status);
    });
  };

  createFolder = function(cb) {
    var dir, dirPath, folders, pointer;
    pointer = __dirname + '/../..';
    folders = config.file.path.split("/");
    dirPath = pointer;
    _.each(folders, function(folder, i) {
      var folderPath;
      dirPath += '/' + folder;
      folderPath = path.resolve(dirPath);
      return fs.mkdir(folderPath, function(e) {
        if (e && e.code !== 'EEXIST') {
          cb(false);
        }
        if ((folders.length - 1) === i) {
          return cb(true);
        }
      });
    });
    return dir = path.resolve(__dirname, pointer + config.file.path);
  };

  makeStream = function() {
    return console.log('makeStream');
  };

  return File;

})();

module.exports = new File;
