class Time

	getDate: (b) ->

		# Get DateTime
		time = new Date

		if b
			# Return date in a,b,c format
			return	time.getFullYear()+'-'+
					lead(time.getMonth()+1)+'-'+
					lead(time.getDate())

		# Return date in nice format
		return	lead(time.getDate())+'-'+
				lead(time.getMonth()+1)+'-'+
				time.getFullYear()


	getTime: ->

		# Get DateTime
		time = new Date

		# Return time in nice format
		return	lead(time.getHours())+':'+
				lead(time.getMinutes())+':'+
				lead(time.getSeconds())


	getMs: ->
		# Get DateTime
		time = new Date

		# Return miliseconds in nice format
		return	'.'+lead(time.getMilliseconds())


	# Add a leading 0 to time
	lead = (time) ->
		('0'+time).slice(-2)



module.exports = new Time