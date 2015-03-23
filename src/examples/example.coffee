# log = require 'de-logger'
log = require '../server/app'

# Set config
log.set
	whipe: true

# Clear the console
log.clear()

data1 =
	a: 1
	b: 2
	c: 3

data2 =
	a: 4
	b: 5
	c: 6

log.func 'First function'
log.debug 'Debugging', 'Debug message', data1

# (Re)Set config
log.set
	time: true

	# Turn off func and debug messages
	func:
		display: false
	debug:
		display: false

log.func 'First function'
log.debug 'Debugging', 'Debug message', data1
log.info 'Webserver', 'Running at port: 8000'
log.event 'Gui input', data2


# (Re)Set config
log.set
	date: true

	# Turn off func and debug messages
	func:
		display: false
	debug:
		display: false

log.warn 'Usermodel', 'Cannot find a user id'
log.error 'Mongodb', 'Connection with mongodb couldn\'t be established'

# (Re)Set config
log.set
	time: false

log.info(data1);

# (Re)Set config
log.set
	time: true
	ms: true

log.event(data2);