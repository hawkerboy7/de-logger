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


	debug: ->
		return unless check 'debug'
		prep arguments, '34m', 'debug'

	info: ->
		return unless check 'info'
		prep arguments, '32m', 'info'

	event: ->
		return unless check 'event'
		prep arguments, '36m', 'event'

	warn: ->
		return unless check 'warn'
		prep arguments, '33m', 'warn'

	error: ->
		return unless check 'error'
		prep arguments, '31m', 'error'



	set: (settings) ->
		@error 'Cannot set Properties yet :('
		# mergeRecursive config, settings


	# --------------------------
	#	Private helper functions
	# --------------------------
	check = (name) -> config.terminal and (config[name]?.display isnt false)

	prep = (argumenten, color, functionName) ->

		set		= 0
		name	= ''
		space	= ''
		space2	= ''
		space3	= ''
		message	= ''

		if argumenten[1] and typeof argumenten[0] is 'string'
			name = argumenten[0]

		# Start of time in black
		message += `'\033[30m'` if config.date or config.time

		if config.date
			set += 1
			message += getDate()

		if config.time
			if set
				message += ' '
			else
				set += 2
			message += getTime()

		if config.time and config.ms
			set		+= 4
			message	+= getMs()

		# End of time color
		message += `'\033[0m'` if config.date or config.time

		# Determin space
		space = '\t' if set isnt 0

		message += space

		# Add function name in color
		message += `'\033['` +color+functionName+ `'\033[0m'`

		# Determin space2
		space2 = '\t' if set is 0

		message += space2

		# Add name
		if name
			message += `'\033[0m'` +name

		# Determin space3
		space3 = '\t' if set is 0

		message += space3

		# Start showing data in light grey
		message += `'\033[37m'`

		# Head to log
		log name, message, argumenten


	log = (name,message, argumenten) ->

		if name
			argumenten[0] = message

		console.log argumenten

		# Turn color back to white
		argumenten[4] = `'\033[0mhoi'`

		console.log argumenten

		# Send the arguments to console log
		console.log.apply null, argumenten

		# Add message to a log file
		logFile name, message if config.file


	iterate = (argumenten) ->

		# argumenten
		return ''


	logFile = (name,message, argumenten) ->
		console.log 'Store in file'


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
		return	':'+lead(time.getMilliseconds())


	# Check if msg needs to be stored and or "console.log-ed"
	logMe = (msg,obj) ->
		unless obj
			logFile msg					if config.store
			console.log msg				if config.terminal
		else
			logFile msg, obj			if config.store
			console.log msg, obj		if config.terminal


	# Add a leading 0 to time
	lead = (time) ->
		('0'+time).slice(-2)



module.exports = Logger