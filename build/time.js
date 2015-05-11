(function() {
  var Time;

  Time = (function() {
    var lead;

    function Time() {}

    Time.prototype.getDate = function(b) {
      var time;
      time = new Date;
      if (b) {
        return time.getFullYear() + '-' + lead(time.getMonth() + 1) + '-' + lead(time.getDate());
      }
      return lead(time.getDate()) + '-' + lead(time.getMonth() + 1) + '-' + time.getFullYear();
    };

    Time.prototype.getTime = function() {
      var time;
      time = new Date;
      return lead(time.getHours()) + ':' + lead(time.getMinutes()) + ':' + lead(time.getSeconds());
    };

    Time.prototype.getMs = function() {
      var time;
      time = new Date;
      return '.' + lead(time.getMilliseconds());
    };

    lead = function(time) {
      return ('0' + time).slice(-2);
    };

    return Time;

  })();

  module.exports = new Time;

}).call(this);
