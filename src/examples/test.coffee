log = require '../server/app'



log.info 'Information 1', 1
log.info 'Information 2', [1, 2, 3]
log.info 'Information 3', a:[1, 2, 3], b: '1', c: {d:1,e:'asd',f:['a', 'b']}
log.info 'Information 4', 'asdf'
