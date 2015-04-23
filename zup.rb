file = ARGV[0]

class Message
	attr_accessor :month, :msg
	def initialize (line)
		@months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dec']
		@month  = ""
		@day 	= ""
		@hour 	= ""
		@min 	= ""
		@msg	= ""

		if (!new_message? line[0..14])
			@msg = line
			puts @msg
		else
			puts "month:\t#{@month}"
			puts "day:\t#{@day}"
			puts "hour:\t#{@hour}"
			puts "min:\t#{@min}"
		end

	end
	def new_message? (str)
		ans = false
		@months.each do |m|
			if m == str[0..2] #verify month
				ans   = true
				month = m
				day   = str[4..5].gsub(/[^0-9]/, '') 
				hour  = str[7..9].gsub(/[^0-9]/, '') 
				min   = str[9..11].gsub(/[^0-9]/, '') 
				if !ready_to_i? day #verify day
					ans = false
				elsif !ready_to_i? hour #verify hour
					ans = false
				elsif !ready_to_i? min #verify minutes	
					ans = false
				else
					@month = month
					@day   = day
					@hour  = hour
					@min   = min
					return ans
				end
			end
		end
		return ans
	end
	def ready_to_i? var
		if var.match(/^\d+$/)
			return true
		else
			return false
		end
	end
end

ms = Message.new(file)