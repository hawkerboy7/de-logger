# --------------------------------------------------
# "Global" variable
# --------------------------------------------------
config = {}

# --------------------------------------------------
# Logger Module
# --------------------------------------------------
class Logger

	constructor: (con) ->

		# Make the config available in this script
		config = con


	# --------------------------
	#	Public log functions
	# --------------------------
	clear: ->
		try
			# Should work on windows too (only tested in Ubuntu 14.04 though...)
			console.log `'\033c'`

		catch e
			# This adds newlines untill console has been cleared and goed back to top
			console.log `'\u001b[2J\u001b[0;0H'`


	func: ->
		return unless check 'func'

		prep arguments, '35m', 'func'




	debug: (type,msg) ->
		prep type, msg, '34m', 'debug'

	info: (type,msg) ->
		prep type, msg, '32m', 'info'

	event: (type,msg) ->
		prep type, msg, '36m', 'event'

	warn: (type, msg) ->
		prep type, msg, '33m', 'warn'

	error: (type, msg) ->
		prep type, msg, '31m', 'error'





	set: (settings) ->
		@error 'Cannot set Properties yet :('
		# mergeRecursive config, settings


	# --------------------------
	#	Private helper functions
	# --------------------------
	check = (name) -> config.terminal and (config[name]?.display isnt false)

	prep = (argumenten, color, functionName) ->

		console.log argumenten
		# console.log argumenten[0]
		# console.log
		# console.log argumenten[2]
		# console.log argumenten[3]

		name	= ''
		message	= ''

		name = argumenten[0] if argumenten[1]

		console.log name



		# msg	= argumenten[1]
		# type	= argumenten[0]


		# space = '   '

		# # Allow for msg-only calls aswell
		# unless msg?
		# 	msg		= space + type
		# 	type	= ''
		# else
		# 	tab = '\t'
		# 	if type.length < 5
		# 		tab = '     \t'
		# 	type = space + type + tab

		# # Allow for objects and arrays as well
		# if typeof msg is 'array' or typeof msg is 'object'

		# 	# Send to logMe with an array or object as well
		# 	return logMe(`'\033['` +color+name+ `'\033[0m:\t'` + getTime(name) + type, msg)

		# # Send to logMe
		# logMe(`'\033['` +color+name+ `'\033[0m:\t'` + getTime(name) + type + msg)


	getTime = (name) ->
		return

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