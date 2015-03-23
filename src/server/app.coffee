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
	file		: false

	# Show date
	date		: false

	# Show time
	time		: false

	# Show ms
	ms			: false

	# Whipe history
	whipe		: false


module.exports = new Logger config