# --------------------------------------------------
# Logger module
# --------------------------------------------------
Logger = require './logger'


# --------------------------------------------------
# Default settings
# --------------------------------------------------
config =

	# Show in terminal
	terminal	: true

	# Store in file
	# file : false
	file :

		# Path where the file needs to be stored
		path: 'logs/hallo/test/kan/dot/wel'

		# Name of the file
		name: 'project-log'

		# Name should contain the current date
		date: true

	# Show date
	date		: false

	# Show time
	time		: false

	# Show ms
	ms			: false

	# Whipe history
	whipe		: false

	# Align message after name
	align		: true

	# Spacing in alignment
	space		: 0


module.exports = new Logger config