# de-logger
Allows you to log events in your project during development and during production in the console and/or in a file.


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

#### clear
Clear the console (this doesn't take arguments)

#### func
Identifing which function is triggered (usually only used in development)

#### info
Display general information like which port your webserver is running on

#### event
Keep track of specific (socket) events.

#### warn
Show warnings

#### error
Show errors

### Usage
It basically works the same way as console.log only it ads colours and formatting to the message.
First agument should be the name of your choosing for the data you want to log. The second argument should be the data. You may also add more arguments containing data. It uses \t to allign your first argument and second argument.

### Example
```javascript
data = {a:1,b:2,c:3};

log.event('My Event Name', data);
```
```javascript
=> info:	My Event Name	{a:1,b:2,c:3}

```

But you can also simply use it like this
```javascript
log.event(data);
```
```javascript
=> info:	{a:1,b:2,c:3}