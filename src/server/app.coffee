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
	date		: true

	# Show time
	time		: true

	# Show ms
	ms			: true



module.exports = new Logger config