# de-logger
Allows you to log events in your project in the console with different colours and alignment.


## Getting Started

Install de-logger using npm install
```javascript
$ npm install de-logger --save
```

Require de-logger in your project
```javascript
var log = require('de-logger');
```

## API
### Methodes

__clear__
Clear the console (this doesn't take arguments)

__func__
Identifing which function is triggered (usually only used in development)

__info__
Display general information like which port your webserver is running on

__event__
Keep track of specific (socket) events.

__warn__
Show warnings

__error__
Show errors

### Usage
It basically works the same way as console.log only it ads colours and formatting to the message.
First agument should be the name of your choosing for the data you want to log. The second argument should be the data. You may also add more arguments containing data. It uses \t and spaces to allign your first and second argument.

### Example
```javascript
var data, data2, log;

log = require('../server/app');

data = {
  a: 1,
  b: 2,
  c: 3
};

data2 = {
  a: 4,
  b: 5,
  c: 6
};

log.clear();

log.func('First function');

log.info('Webserver', data);

log.event('Gui input', data2);

log.warn('Usermodel', 'Cannot find a user id');

log.error('Mongodb', 'Connection with mongodb couldn\'t be established');

```
Output
```
func:	First function
info:	Webserver	{ a: 1, b: 2, c: 3 }
event:	Gui input	{ a: 4, b: 5, c: 6 }
warn:	Usermodel	Cannot find a user id
error:	Mongodb		Connection with mongodb couldn't be established

```

But you can also simply use it like this
```javascript
log.info(data);
log.event(data);
```
Output
```
info:	{a:1,b:2,c:3}
event:	{a:4,b:5,c:6}
```

## Planned Features

### Provide options

- Turn time / date on or off

- Different logging in development and production (staging)

- Save log messages to a log file

### Change the func method
Make method func self aware. So if it is possible let the func method figure out the name of the function it is in.