var File, _, config, file, fs, path, self;

_ = require('underscore');

fs = require('fs');

path = require('path');

self = null;

file = null;

config = null;

File = (function() {
  var makeStream;

  function File() {}

  File.prototype.build = function(cfg) {
    var dir, pointer;
    config = cfg;
    self = this;
    if (!config.file) {
      return;
    }
    pointer = '../../';
    dir = path.resolve(__dirname, pointer + config.file.path);
    return fs.mkdir(dir, function(e) {
      var made;
      if (!e) {
        return made = true;
      }
      if (e.code === 'EEXIST') {
        return made = true;
      }
      if (e) {
        return console.log(e);
      }
    });
  };

  makeStream = function() {};

  return File;

})();

module.exports = new File;
