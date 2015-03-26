# npm
_		= require 'underscore'

# node
fs		= require 'fs'
path	= require 'path'

# own
time	= require './time'

# "global" variables
config			= null
stream			= null
folderPath		= null
messagesBuffer	= false


# --------------------------------------------------
#	File write Module
# --------------------------------------------------
class File

	build: (cfg) ->

		# Make the config globally available
		config = cfg

		# Return if no config is found
		return unless config.file

		# Creates the folder in which to store log files
		createFolder (e) ->

			# Disable the log->file since the file path couldn't be made
			# Show error?
			return disabled = true if e

			# Create log write stream
			createStream (e) ->

				# Disable the log->file since the file couldn't be made
				return disabled = true if e

				# Log al events stored in the buffer into the file
				logMessagesBuffer()


	log: ->

		unless stream

			# Start the log message buffer
			messagesBuffer = [] unless messagesBuffer

			# Create txt message from arguments
			message = handle arguments

			# Store messages
			messagesBuffer.push message

		else
			# Create txt message from arguments
			message = handle arguments

			writeMessage message


	# --------------------------
	#	Private helper functions
	# --------------------------
	createFolder = (cb) ->

		# Set starting path
		pointer = __dirname + '/../../../..'
		# pointer = __dirname + '/../..'

		# Folders / path to be created
		folders = config.file.path.split "/"

		# Directory path
		dirPath = pointer

		# Count
		i = 0

		# Make folders
		makeNext folders, dirPath, i, cb


	makeNext = (folders, dirPath, i, cb) ->

		# Add new folder to the path
		dirPath += '/'+folders[i]

		# Create a valid folder path
		folderPath = path.resolve dirPath

		# Create folder
		fs.mkdir folderPath, (e) ->

			# Directory was made or directory already exists so it has been made already
			if e and e.code isnt 'EEXIST'

				# Cannot make this folder / path
				cb e

			# Have all directories been made?
			if (folders.length-1) is i

				return cb null

			else
				# Increase count
				i++

				# Make next folder
				makeNext folders, dirPath, i, cb


	createStream = (cb) ->

		# Set the name to incluse the date, time, ms and file name
		name = time.getDate(true)+' '+time.getTime()+time.getMs()+' '+config.file.name

		# Make file path
		filePath = folderPath+'/'+name+'.txt'

		# Try to create the stream file
		try
			stream = fs.createWriteStream filePath
		catch e
			cb e

		# Everything is ok
		cb null


	logMessagesBuffer = ->

		_.each messagesBuffer, (message) ->

			writeMessage message


	handle = (argumenten) ->

		name			= argumenten[0]
		functionName	= argumenten[1]
		args			= argumenten[2]

		# Format message
		message = time.getDate(true)+' '+time.getTime()+time.getMs()
		message += '  '+functionName

		if name
			message += ' '+name+' →'

		_.each args, (arg,i) ->

			return if i is '0' if name

			return message += ' '+JSON.stringify arg if typeof arg is 'object'

			message += ' '+arg

		message


	writeMessage = (message) ->

		stream.write message+'\n'



module.exports = new File


































