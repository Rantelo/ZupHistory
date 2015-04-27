class Message
	attr_accessor :month, :day, :hour, :min, :sender, :msg
	def initialize (line)
		@months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dec']
		@month  = ""
		@day 	= ""
		@hour 	= ""
		@min 	= ""
		@sender = ""
		@msg	= ""

		if (new_message? line)
			@month = line[0..2]
			@day   = line[4..5][/[0-9][0-9]/].to_i
			@hour  = line[7..9][/[0-9][0-9]/].to_i
			@min   = line[10..12][/[0-9][0-9]/].to_i
			@sender= line[13..line.length][/- ([A-Za-z0-9 ])+:/][/(([A-Za-z0-9]+) ?)+/]
			@msg   = line[17 + @sender.length..line.length]
		else
			@msg = line
		end
	end

	def new_message? (line)
		if @months.include? line[0..2]
			m = line[0..2]
			return true if line.match(/^#{m} (([12][0-9])|(3[01])|([1-9])), (([01][0-9])|(2[0-3])):(([0-5][0-9])) - (([A-Za-z0-9])+ ?)+:/)
		end
		return false
	end
end