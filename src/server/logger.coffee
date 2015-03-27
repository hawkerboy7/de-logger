# npm
_		= require 'underscore'

# own
file	= require './file'
time	= require './time'

# "global" variables
self = null
config = null
stream = null

# --------------------------------------------------
#	Logger Module
# --------------------------------------------------
class Logger

	constructor: (con) ->

		# Make the config available in this script
		config = con

		# Make reference to the this scope
		self = @


	# --------------------------
	#	Public log functions
	# --------------------------
	clear: ->
		if config.clear
			# Clear and wipe history
			console.log `'\033c'`
		else
			# Clear and mantain history
			console.log `'\u001b[2J\u001b[0;0H'`

	func: ->
		return unless check 'func'
		prep arguments, '35m', 'func '

	debug: ->
		return unless check 'debug'
		prep arguments, '34m', 'debug'

	info: ->
		return unless check 'info'
		prep arguments, '32m', 'info '

	event: ->
		return unless check 'event'
		prep arguments, '36m', 'event'

	warn: ->
		return unless check 'warn'
		prep arguments, '33m', 'warn '

	error: ->
		return unless check 'error'
		prep arguments, '31m', 'error'

	set: (settings) ->
		deepMerge config, settings

		# Create file to write log messages to
		file.build config if config.file.enabled


	# --------------------------
	#	Private helper functions
	# --------------------------
	check = (name) -> (config.terminal or config.file.enabled) and (config[name]?.display isnt false)

	prep = (argumenten,color,functionName) ->

		# Store the input
		inputs = _.extend {}, argumenten

		# Don't to anything if arguments are not provided
		return unless argumenten[0]

		set		= 0
		name	= ''
		message	= ''

		if !!(argumenten[1] and typeof argumenten[0] is 'string')
			name = argumenten[0]

		# Start of time in black
		message += `'\033[30m'` if config.date or config.time

		if config.date
			set += 1
			message += time.getDate()

		if config.time
			if set
				message += ' '

			set += 2
			message += time.getTime()

		if config.time and config.ms
			set		+= 4
			message	+= time.getMs()

		# End of time color
		message += `'\033[0m'` if config.date or config.time

		# Determin space
		if set
			message += '  '

		# Add function name in color
		message += `'\033['` +color+functionName+ `'\033[0m'`

		# Add name
		if name

			message += `' \033[0m'` +name+ `'\033[037m'`

			if config.align

				# Get string length
				length = name.length

				# Check if the string's length is bigger than prevous length
				config.space = length if length > config.space

				# Count
				i=0

				# Add spaces for the missing length of the string
				while i < (config.space-length)

					# Add space
					message += ' '

					# Incease count
					i++

		# Determin space3
		message += ' → ' if name

		# Head to log
		log name,message,argumenten,inputs, functionName


	log = (name,message,argumenten,inputs,functionName) ->

		result = []

		unless name
			result.push message
			result.push argumenten[0]
		else
			argumenten[0] = message

			_.each argumenten, (argument) => result.push argument

		# Turn color back to white
		result.push `'\033[0m'`

		# Send the arguments to console log
		console.log.apply null, result

		# Add message to a log file
		file.log name, functionName, inputs if !file.disabled and config.file.enabled


	deepMerge = (obj1, obj2) ->

		for p of obj2
			try
				if typeof obj2[p] is 'object'
					obj1[p] = deepMerge obj1[p], obj2[p]
				else
					obj1[p] = obj2[p]
			catch e
				obj1[p] = obj2[p]

		return obj1



module.exports = Logger