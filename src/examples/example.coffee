# log = require 'de-logger'
log = require '../server/app'

data1	= '{"a":"1","b":"2","c":"3"}'
data2	= a:1,b:2,c:3
data3	= [1,2,3]

log.clear()

log.func	'1', 2, [3], a:4
log.func	'Object', a:4
# log.debug	'Your Part',	'Page crawler results:', data1
# log.info	'Webserver',	data2
# log.event	'Gui input',	data3
# log.warn	'Usermodel',	'Cannot find a user id', 'lol?'
# log.error	'Mongodb',		'Connection with mongodb couldn\'t be established'