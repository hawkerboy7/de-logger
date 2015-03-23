# log = require 'de-logger'
log = require '../server/app'

data1	= '{"a":"1","b":"2","c":"3"}'
data2	= a:1,b:2,c:3
data3	= [1,2,3]

log.clear()

log.func	'func',		a:3, b:3, [1,2,3,4]
log.debug	'debug',	{a:3}, {b:3}
log.info	'info',		{a:3,b:3}
log.event	'event','event','event'
log.warn	'warn',	'warn',	'warn'
log.error	'error1','error2','error3','error4','error5','error6'

# log.debug	'Your Part',	'Page crawler results:', data1
# log.info	'Webserver',	data2
# log.event	'Gui input',	data3
# log.warn	'Usermodel',	'Cannot find a user id', 'lol?'
# log.error	'Mongodb',		'Connection with mongodb couldn\'t be established'