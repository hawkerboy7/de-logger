# de-logger
## Getting Started

Install de-logger using npm install
```javascript
npm install de-logger --save
```

Require de-logger in your project
```javascript
var log = require('de-logger');
```

## API

### set({config})
Change the default configuration by providing a config object. This can be done at any time during you project and multiple times. This way data in your project can be logged differently at any point in your project.

##### Default Config
```javascript
config = {
  "ms":       false,
  "date":     false,
  "time":     false,
  "align":    true,
  "space":    0,
  "whipe":    false,
  "terminal": true
};
```
__ms__ _true / false_
Add miliseconds to time (only works if time is true)

__date__ _true / false_
Show the current date

__time__ _true / false_
Show the current time

__align__ _true / false_
Will make sure the data logged after the name is in alignment with the largest name provided.
```javascript
info  Name_short → First value          // space = 10
info  Name_normal → Second value        // space = 11
info  Name        → Third value         // space = 11
info  Name_even_lager → Fourth value    // space = 15
info  name_short      → Fifth value     // space = 15
info  hi              → Sixth value     // space = 15
```
__space__     _int_    _ _
The amount of characters the name area should contain. Default is 0 and grows whenever a name with a bigger length is provided (as is shown in the example above), but you can choose to start with another number.

__whipe__     _true / false_
This will also clear the console history

__terminal__  _true / false_
Show messages in the terminal

___Do not show messages from a specific function___<br>
You can also turn of a specific log function. Remember they will stay turned off untill you swich them on again somewhere in your code.
```javascript
log.set({
  "func":  { display: false }
  "event": { display: false }
});
```

### clear()
Clears the console. Based on your config your console scroll history will be wiped too.

### func(*)
Identifing which function is triggered (suppling the function name is still required for now)

### debug(*)
Display debug information

### info(*)
Display general information like which port your webserver is running on

### event(*)
Keep track of specific (socket) events.

### warn(*)
Show warnings

### error(*)
Show errors


## Usage
\* It basically works the same way as console.log() only it ads colours and formatting to the messages. First agument should be the name of your choosing for the data you want to log. The rest of the arguments should be the data. You may also provide one argument containing data.


## Simple Example
```javascript
var log = require('de-logger');
var port = 8000;
log.info('Name','Running at port:', port);
```
Simple output
```
info  Name → Running at port: 8000
```


## Big Example
```javascript
var data1, data2, log;

log = require('de-logger');

log.set({
  whipe: true
});

log.clear();

data1 = {
  a: 1,
  b: 2,
  c: 3
};

data2 = {
  a: 4,
  b: 5,
  c: 6
};

log.func('First function');

log.debug('Debugging', 'Debug message', data1);

log.set({
  time: true,
  func: {
    display: false
  },
  debug: {
    display: false
  }
});

log.func('First function');

log.debug('Debugging', 'Debug message', data1);

log.info('Webserver', 'Running at port: 8000');

log.event('Gui input', data2);

log.set({
  date: true,
});

log.warn('Usermodel', 'Cannot find a user id');

log.error('Mongodb', 'Connection with mongodb couldn\'t be established');
```
Big Output
```
func  First function
debug Debugging → Debug message { a: 1, b: 2, c: 3 }
09:19:28  info  Webserver → Running at port: 8000
09:19:28  event Gui input → { a: 4, b: 5, c: 6 }
23-03-2015 09:19:28  warn  Usermodel → Cannot find a user id
23-03-2015 09:19:28  error Mongodb → Connection with mongodb couldn't be established
```
You can still provide your data as the only argument
```javascript
log.set({
  date: true,
  time: false
});

log.info(data1);

log.set({
  time: true,
  ms: true
});

log.event(data2);
```
Output
```
23-03-2015  info  { a: 1, b: 2, c: 3 }
23-03-2015 09:20:47.91  event { a: 4, b: 5, c: 6 }
```


## Planned Features

### Save log messages to a log file

### Individual config
Configure methodes individually (with regard to time, date and ms).

### Change the func method
~~Make method func self aware. So if it is possible let the func method figure out the name of the function it is in.~~
This doesn't appear to be possible (in .coffee) since it only uses anonymous functions.