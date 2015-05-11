log = require 'de-logger'
# log = require '../app'

data1 =
	a: 1
	b: 2
	c: 3

data2 =
	a: 4
	b: 5
	c: 6

log.info data1

# (Re)Set config
log.set
	time: true
	ms: true

log.event data2