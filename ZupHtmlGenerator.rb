require_relative 'message.rb'
require_relative 'html_strings_utilities.rb'

file = ARGV[0].to_s
user = ARGV[1].to_s

html_util = html_strings_utilities.new(user)
new_file_regex = {/ / => '_', /.txt/ => '.html'}
new_file = ""
new_file_regex.each do |key, value|
	new_file = file.gsub(key, value)
end

File.open(new_file, "a+") do |html|
	html.puts html_util.start
	prev_message = Message.new("")
	File.open(file, 'r').each_line do |line|
		message = Message.new(line)
		if message.sender == ""
			prev_message.msg += "#{message.msg}"
		else
			html.puts html_util.bubble(prev_message)
			prev_message = message
		end
	end
	html.puts html_util.bubble(prev_message)
	html.puts html_util.end
end	
