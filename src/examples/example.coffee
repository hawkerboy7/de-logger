# log = require 'de-logger'
log = require '../server/app'

# Set config
log.set
	date: true
	whipe: true

# Clear the console
log.clear()

# Log all function types
log.func	'func'	,a:1
log.debug	'debug'	,{a:1}	,{b:2}
log.info	'info'	,'info'	,[1,2,3,4]
log.event	'event'	,'event','event'
log.warn	'warn'	,'warn'	,'warn'	,'warn'
log.error	'error'	,'error','error','error','error'

# (Re)Set config
log.set
	date: false

	# Turn off func and debug messages
	func:
		display: false
	debug:
		display: false

# Log all function types
log.func	'func'	,a:1
log.debug	'debug'	,{a:1}	,{b:2}
log.info	'info'
log.event	'event'
log.warn	'warn'	,'warn'	,'warn'	,'warn'
log.error	'error'	,'error','error','error','error'
