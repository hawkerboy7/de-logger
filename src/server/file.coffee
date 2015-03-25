fs		= require 'fs'
path	= require 'path'


class File

	constructor: ->



	build: ->

		console.log 'Build file'



module.exports = new File



# build = ->

# 	# Check if a config has been made for the file
# 	return unless config.file

# 	# Pointer which to ../../../ in production
# 	# pointer = '../../../'
# 	pointer = '../../'

# 	# Create dir path if it doesn't exist
# 	dir = path.resolve __dirname, pointer+config.file.path

# 	fs.mkdir dir, (e) ->

# 		return self.error 'Build directory', e if e

# 		self.info 'Build directory', 'Was succefull', dir


# 	# name = config.file.name

# This file will be in node_modules of a project
# Going up 3 directories should place your log in the root of the project
# filePath =  dir +'/'+name

# console.log filePath

# try
# 	stream = fs.createWriteStream filePath
# catch e
# 	self.error 'Log file', 'Couldn\'t create a log file error: ', e

# console.log stream
# stream.once