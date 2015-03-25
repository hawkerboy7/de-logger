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

			console.log 'status', status


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

		# Create each folder to create the path
		_.each folders, (folder, i) ->

			# Add new folder to the path
			dirPath += '/'+folder

			# Create a valid folder path
			folderPath = path.resolve dirPath

			# Create folder
			fs.mkdir folderPath, (e) ->

				# Directory was made or directory already exists so it has been made already
				if e and e.code isnt 'EEXIST'

					# Cannot make this folder / path
					cb false

				# Go to next directory or it's finished
				cb true if (folders.length-1) is i

		# Create path of directory
		dir = path.resolve __dirname, pointer+config.file.path



	makeStream = ->

		console.log 'makeStream'




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





































