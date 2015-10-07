class Timer

	attr_accessor :seconds

	def initialize
		@seconds = 0
	end

	def time_string

		seconds = @seconds%60
		minutes = (@seconds/60)%60
		hours = (@seconds/60/60)%12
		minutes_s = minutes.to_s
		hours_s = hours.to_s
		seconds_s = seconds.to_s
		if minutes < 10
			minutes_s = "0" + minutes.to_s
		end
		if hours < 10
			hours_s = "0" + hours.to_s
		end
		if seconds < 10
			seconds_s = "0" + seconds.to_s
		end
		hours_s + ":" + minutes_s + ":" + seconds_s
	end

end