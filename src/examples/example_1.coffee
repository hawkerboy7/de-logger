log = require '../server/app'

log.set
	space: 5

log.func  'Func' , 'These'
log.debug 'Debug', 'are'
log.info  'Info' , 'all the'
log.event 'Event', 'basic'
log.warn  'Warn' , 'log'
log.error 'Error', 'commands'