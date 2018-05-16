# --------------------------------------------------
# Logger module
# --------------------------------------------------
Logger = require './logger'


# --------------------------------------------------
# Default settings
# --------------------------------------------------
config =

	# Show in terminal
	terminal : true

	# Store in file
	file :

		# On or off
		enabled	: false

		# Path where the file needs to be stored
		path: 'logs'

		# Name of the file
		name: 'project-name'

	# Show date
	date : true

	# Show time
	time : true

	# Show ms
	ms : false

	# Whipe history
	whipe : false

	# Align message after name
	align : true

	# Spacing in alignment
	space : 0


module.exports = new Logger config
