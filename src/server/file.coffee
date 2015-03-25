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

		# Set starting path
		# pointer = '../../../'
		pointer = '../../'

		# Create path of directory
		dir = path.resolve __dirname, pointer+config.file.path

		# Create directory
		fs.mkdir dir, (e) ->

			# Directory was made
			return made = true unless e

			# Directory already exists so it's made
			return made = true if e.code is 'EEXIST'

			# Log error
			console.log e if e


	# --------------------------
	#	Private helper functions
	# --------------------------
	makeStream = ->




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





































