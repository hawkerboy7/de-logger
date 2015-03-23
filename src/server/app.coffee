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

	# # Global settings
	# global:
	# 	use			: true
	# 	notify		: false
	# 	time:
	# 		show	: false
	# 		date	: false

	# func:
	# 	display		: true
	# 	time:
	# 		show	: true
	# 		date	: false

	# debug:
	# 	display		: true
	# 	time:
	# 		show	: true
	# 		date	: false

	# info:
	# 	display		: true
	# 	time:
	# 		show	: true
	# 		date	: false

	# event:
	# 	display		: true
	# 	time:
	# 		show	: true
	# 		date	: false

	# warn:
	# 	display		: true
	# 	time:
	# 		show	: true
	# 		date	: false

	# error:
	# 	display		: true
	# 	time:
	# 		show	: true
	# 		date	: false



module.exports = new Logger config