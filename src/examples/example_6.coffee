log = require 'de-logger'
# log = require '../server/app'

log.clear()

log.set
	file :
		enabled: true

		# Name of the file
		name: 'example_6_1'

log.info 'Information 1', 1
log.info 'Information 2', [1, 2, 3]



log.set
	file :
		enabled: false

		# Name of the file
		name: 'example_6_2'

log.info 'Information 3', 1
log.info 'Information 4', [1, 2, 3]



log.set
	file :
		enabled: true

		# Path where the file needs to be stored
		path: 'logss'

		# Name of the file
		name: 'example_6_3'

log.info 'Information 5', 1
log.info 'Information 6', [1, 2, 3]
