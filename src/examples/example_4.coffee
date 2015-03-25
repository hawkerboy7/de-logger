# log = require 'de-logger'
log = require '../server/app'

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

	# Also show time
	time: true

	# Turn off func and debug messages
	func:
		display: false
	debug:
		display: false

# Log a function, debug, info and event message
log.func 'First function'							# This will not be displayed due to the config on line 19
log.debug 'Debugging', 'Debug message', data1		# This will not be displayed due to the config on line 19
log.info 'Webserver', 'Running at port: 8000'
log.event 'Gui input', data2


# (Re)set config
log.set

	# Also show date
	date: true

# Log a warning and an error
log.warn 'Usermodel', 'Cannot find a user id'
log.error 'Mongodb', 'Connection with mongodb couldn\'t be established'