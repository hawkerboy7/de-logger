# npm
_		= require 'underscore'

# node
fs		= require 'fs'
path	= require 'path'

# "global" variables
self	= null
file	= null
config	= null


# --------------------------------------------------
#	File write Module
# --------------------------------------------------
class File

	build: (cfg) ->

		# Make the config globally available
		config = cfg

		# Make a global reference to the File class
		self = @

		# Return if no config is found
		return unless config.file

		# Creates the folder in which to store log files
		createFolder (status) ->

			# Disable the log->file since the file path couldn't be made
			return disabled = true if status

			# Create log write stream
			createStream (res) ->

				console.log 'stream', res

	log: ->
		# console.log 'hoi'



	# --------------------------
	#	Private helper functions
	# --------------------------
	createFolder = (cb) ->

		# Set starting path
		# pointer = __dirname + '/../../..'
		pointer = __dirname + '/../..'

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
				cb false

			# Have all directories been made?
			if (folders.length-1) is i

				return cb true

			else
				# Increase count
				i++

				# Make next folder
				makeNext folders, dirPath, i, cb


	createStream = ->

		console.log 'createStream'




module.exports = new File










# 	# name = config.file.name

# This file will be in node_modules of a project
# Going up 3 directories should place your log in the root of the project
#

# console.log filePath

# try
# 	stream = fs.createWriteStream filePath
# catch e
# 	self.error 'Log file', 'Couldn\'t create a log file error: ', e

# console.log stream
# stream.once





































