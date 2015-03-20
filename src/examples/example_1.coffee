# log = require 'de-logger'
log = require '../server/app'

data	= a:1,b:2,c:3
data2	= a:4,b:5,c:6

log.clear()

log.func	'First function'
log.info	'Webserver',	data
log.event	'Gui input',	data2
log.warn	'Usermodel',	'Cannot find a user id'
log.error	'Mongodb',		'Connection with mongodb couldn\'t be established'
