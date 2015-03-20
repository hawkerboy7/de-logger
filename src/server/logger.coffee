# --------------------------------------------------
# Npm modules
# --------------------------------------------------
_ = require 'underscore'


# --------------------------------------------------
# Global variable
# --------------------------------------------------
config = {}

# --------------------------------------------------
# Logger Module
# --------------------------------------------------
class Logger

	constructor: (conf) ->

		# Make the config globally available
		config = conf

		# Completely block the log
		return unless config.on

		# Check if users wants to be notified
		if config.global.notify

			# Notify if globals are being used or not
			if config.global.use
				console.log `'\033[32minfo\033[0m:\t'` + 'Time will be displayed the same for each function!\n'
			else
				console.log `'\033[32minfo\033[0m:\t'` + 'Time will be displayed on individual basis!\n'


	# --------------------------
	#	Public log functions
	# --------------------------
	set: (settings) ->
		@error 'Cannot set Properties yet :('
		# mergeRecursive config, settings

	error: (type, msg) ->
		prep type, msg, '31m', 'error'	if config.error.display

	info: (type,msg) ->
		prep type, msg, '32m', 'info'	if config.info.display

	func: (type,msg) ->
		prep type, msg, '34m', 'func'	if config.func.display

	event: (type,msg) ->
		prep type, msg, '36m', 'event'	if config.event.display

	warn: (type, msg) ->
		prep type, msg, '33m', 'warn'	if config.warn.display

	clear: -> console.log `'\u001b[2J\u001b[0;0H'`


	# --------------------------
	#	Private helper functions
	# --------------------------
	prep = (type, msg, color, name) ->

		return unless config.on

		space = '   '

		# Allow for msg-only calls aswell
		unless msg?
			msg		= space + type
			type	= ''
		else
			tab = '\t'
			if type.length < 5
				tab = '     \t'
			type = space + type + tab

		# Allow for objects and arrays as well
		if typeof msg is 'array' or typeof msg is 'object'

			# Send to logMe with an array or object as well
			return logMe(`'\033['` +color+name+ `'\033[0m:\t'` + getTime(name) + type, msg)

		# Send to logMe
		logMe(`'\033['` +color+name+ `'\033[0m:\t'` + getTime(name) + type + msg)


	getTime = (name) ->

		# Get time now
		time = new Date

		# Check if global setting should be used
		if config.global.use

			# Check if time is need acoording to global
			return '' unless config.global.time.show

			# Return time
			return makeTime time unless config.global.time.date

			# Return date and time
			return makeDateTime time

		# Check if time is needed
		return '' unless config[name].time.show

		# Return time
		return makeTime time unless config[name].time.date

		# Return date and time
		makeDateTime time


	# Only time
	makeTime = (time) ->
		return	lead(time.getHours())			+ ':' +
				lead(time.getMinutes())			+ ':' +
				lead(time.getSeconds())


	# Complete datetime
	makeDateTime = (time) ->
		return	lead(time.getDate())			+ '-' +
				lead(time.getMonth()+1)			+ '-' +
				lead(time.getFullYear())		+ ' ' +
				lead(time.getHours()) 			+ ':' +
				lead(time.getMinutes())			+ ':' +
				lead(time.getSeconds())			+ '.' +
				lead(time.getMilliseconds())	+ ' '


	# Check if msg needs to be stored and or "console.log-ed"
	logMe = (msg,obj) ->
		unless obj
			logFile msg					if config.store
			console.log msg				if config.terminal
		else
			logFile msg, obj			if config.store
			console.log msg, obj		if config.terminal


	logFile = (msg) ->
		console.log 'Store in file'


	# Add a leading 0 to time
	lead = (time) ->
		('0'+time).slice(-2)


	# Merge two objects correctly (doesn't work correctly yet)
	mergeRecursive = (obj1, obj2) ->

		for p of obj2

			try
				# Property in destination object set; update its value.
				if obj2[p].constructor is Object
					obj1[p] = MergeRecursive(obj1[p], obj2[p])
				else
					obj1[p] = obj2[p]
			catch e

				# Property in destination object not set; create it and set its value.
				obj1[p] = obj2[p]

			obj1



module.exports = Logger