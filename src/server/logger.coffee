# --------------------------------------------------
# NPM module
# --------------------------------------------------
_ = require 'underscore'

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
		_.extend config, settings

	# --------------------------
	#	Private helper functions
	# --------------------------
	check = (name) -> config.terminal and (config[name]?.display isnt false)

	prep = (argumenten,color,functionName) ->

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
			message += getDate()

		if config.time
			if set
				message += ' '

			set += 2
			message += getTime()

		if config.time and config.ms
			set		+= 4
			message	+= getMs()

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

		# Determin space3
		message += ' → ' if name

		# Head to log
		log name, message, argumenten


	log = (name,message,argumenten) ->

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
		logFile name, argumenten if config.file


	getDate = ->

		# Get DateTime
		time = new Date

		# Return date in nice format
		return	lead(time.getDate())+'-'+
				lead(time.getMonth()+1)+'-'+
				time.getFullYear()


	getTime = ->

		# Get DateTime
		time = new Date

		# Return time in nice format
		return	lead(time.getHours())+':'+
				lead(time.getMinutes())+':'+
				lead(time.getSeconds())


	getMs = ->
		# Get DateTime
		time = new Date

		# Return miliseconds in nice format
		return	'.'+lead(time.getMilliseconds())


	# Add a leading 0 to time
	lead = (time) ->
		('0'+time).slice(-2)


	logFile = (name,argumenten) ->
		console.log 'Cannot log to file yet. Wait for version 0.2.0'



module.exports = Logger