var File, fs, path;

fs = require('fs');

path = require('path');

File = (function() {
  function File() {}

  File.prototype.build = function() {
    return console.log('Build file');
  };

  return File;

})();

module.exports = new File;
