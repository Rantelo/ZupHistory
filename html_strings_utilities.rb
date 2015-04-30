require_relative "message.rb"

class html_strings_utilities
	attr_accessor :start, :end, :user

	def initialize (user)
		@user = user
		@start= "<!DOCTYPE html>\n"+
				"<html>\n"+
				"<head>\n"+
				"<meta charset=\"utf-8\">\n"+
				"	<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"+
				"	<title></title>\n"+
				"	<link rel=\"stylesheet\" href=\"zup.css\">\n"+
				"</head>\n"+
				"<body>\n"+
				"	<div id=\"conversation\">\n"
		
		@end  =	"	</div>"+
				"</body>"+
				"	<script type=\"text/javascript\" src=\"zup.js\"></script>"+
				"</html>"

		@msg = ""
	end

	def bubble (message)
		@msg =  "<div class=\"#{user? message.sender}\">\n"+
				"	<canvas class=\"#{side? message.sender}\" width=\"12\" height=\"24\"></canvas>\n"+
				"	<div class=\"message\">\n"+
				"		<p class=\"say\">#{message.msg.gsub(/\n/, '</br>')}</p>\n"+
				"		<p class=\"time\">#{message.hour}:#{message.min}</p>\n"+
				"	</div>\n"+
				"</div>\n"
		@msg.gsub!(/<\/br><\/p>/,'</p>')
	end

	def user? sender
		return ((sender.include? user) ? "me" : "other")
	end
	def side? sender
		return ((sender.include? user) ? "right" : "left")
	end
end
