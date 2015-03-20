# --------------------------------------------------
# Logger module
# --------------------------------------------------
Logger = require './logger'


# --------------------------------------------------
# Default settings
# --------------------------------------------------
config =

	# Turn on or off completely
	on				: true

	# Show in terminal
	terminal		: true

	# Store log
	store			: false

	# Global settings
	global:
		use			: true
		notify		: false
		time:
			show	: false
			date	: false

	error:
		display		: true
		time:
			show	: true
			date	: false

	info:
		display		: true
		time:
			show	: true
			date	: false

	func:
		display		: true
		time:
			show	: true
			date	: false

	event:
		display		: true
		time:
			show	: true
			date	: false

	warn:
		display		: true
		time:
			show	: true
			date	: false



module.exports = new Logger config