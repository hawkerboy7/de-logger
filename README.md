# de-logger
## Getting Started

Install de-logger using npm install
```javascript
npm install de-logger --save
```

Require _de-logger_ in your project and you're ready to go!
```javascript
var log = require('de-logger');
```

## Example 1
The examples are written in coffeescript. For an example in javascript check the [examples folder](https://github.com/hawkerboy7/de-logger/tree/master/build/examples).
```coffeescript
log = require 'de-logger'

log.func  'Func' , 'These'
log.debug 'Debug', 'are'
log.info  'Info' , 'all the'
log.event 'Event', 'basic'
log.warn  'Warn' , 'log'
log.error 'Error', 'commands'
```
![basics](https://cloud.githubusercontent.com/assets/2284480/6832640/1208953c-d328-11e4-8cba-07487507eade.png)

## API

### set({config})
Change the default configuration by providing a config object ([example 2](https://github.com/hawkerboy7/de-logger/tree/master/build/examples)). This can be done at any time during you project and multiple times (which is shown in [example 4](https://github.com/hawkerboy7/de-logger/tree/master/build/examples)). This way data in your project can be logged differently at any point in your project.

```coffeescript
# Example 2 - Default config
log = require 'de-logger'

config =
  ms:       false
  date:     false
  time:     false
  align:    true
  space:    0
  whipe:    false
  terminal: true

log.set config
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
[green] info  Name_short → First value          // space = 10
[green] info  Name_normal → Second value        // space = 11
[green] info  Name        → Third value         // space = 11
[green] info  Name_even_lager → Fourth value    // space = 15
[green] info  name_short      → Fifth value     // space = 15
[green] info  hi              → Sixth value     // space = 15
```
__space__ _int_
The amount of characters the name area should contain. Default is 0 and grows whenever a name with a bigger length is provided (as is shown in the example above) but you can choose to start with another number.

__whipe__ _true / false_
This will also clear the console history

__terminal__ _true / false_
Show messages in the terminal

___Do not show messages from a specific function___<br>
You can also turn of a specific log function. Remember they will stay turned off untill you swich them on again somewhere in your code ([example 3](https://github.com/hawkerboy7/de-logger/tree/master/build/examples)).
```coffeescript
# Example 3
log = require 'de-logger'

log.set
  func:
    display: false
  event:
    display: false
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

\* The arguments that should be provided are explained in [Usage](https://github.com/hawkerboy7/de-logger#usage).


## Usage
It basically works the same way as console.log() only it ads colors and alignment to the messages. The first agument is assumed to be the name of the data you want to log. The rest of the arguments should be the data you want to log. You may also provide one argument containing data. This way the log will be nameless.


## Example 4
```coffeescript
log = require 'de-logger'

# Set config to also whipe the history of the console
log.set
  whipe: true

# Clear the console (and whipe it's history)
log.clear()

# Set some data variables
data1 = a: 1, b: 2, c: 3
data2 = a: 4, b: 5, c: 6

# Log a function and a debug message
log.func 'First function'
log.debug 'Debugging', 'Debug message', data1

# (Re)set config
log.set

  # Show time
  time: true

  # Turn off func and debug messages
  func:
    display: false
  debug:
    display: false

# Log a function, debug, info and event message
log.func 'First function'                       # This will not be displayed
log.debug 'Debugging', 'Debug message', data1   # This will not be displayed
log.info 'Webserver', 'Running at port: 8000'
log.event 'Gui input', data2

# (Re)set config
log.set

  # Show date
  date: true

# Log a warning and an error
log.warn 'Usermodel', 'Cannot find a user id'
log.error 'Mongodb', 'Connection couldn\'t be established'
```
![example 4](https://cloud.githubusercontent.com/assets/2284480/6836823/25cb4d30-d346-11e4-849b-497d6dc1948c.png)

You can still provide your data as the only argument
```coffeescript
# Example 5
log = require 'de-logger'

data1 =
  a: 1
  b: 2
  c: 3

data2 =
  a: 4
  b: 5
  c: 6

log.info(data1);

# (Re)Set config
log.set
  time: true
  ms: true

log.event(data2);
```
Output<br>
![example5](https://cloud.githubusercontent.com/assets/2284480/6837069/6c486368-d348-11e4-8ef2-82ac81920c5e.png)


## Planned Features

### Save log messages to a log file

### Individual config
Configure methodes individually (with regard to time, date and ms).

### Change the func method
~~Make method func self aware. So if it is possible let the func method figure out the name of the function it is in.~~ This doesn't appear to be possible (in .coffee) since it only uses anonymous functions.