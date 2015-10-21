require 'jumpstart_auth'
require 'bitly'
require 'klout'

Bitly.use_api_version_3

class MicroBlogger
	attr_reader :client

	def initialize
		puts "Initializing..."
		Bitly.use_api_version_3
		@bitly = Bitly.new("hungryacademy", "R_430e9f62250186d2612cca76eee2dbc6")
		@client = JumpstartAuth.twitter
		Klout.api_key = 'xu9ztgnacmjx3bu82warbr3h'
	end

	def tweet(message)
		if message.length <= 140
			@client.update(message)
		else
			puts "Longer than 140 characters. Do not post the tweet."
		end
	end

	def run
		puts "Welcome to the JSL Twitter Client"
		command = ""
		while command != 'q'
			printf "enter command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]
			case command
			when 'q' then puts "Goodbye!"
			when 't' then tweet(parts[1..-1].join(" "))
			when 'dm' then dm(parts[1], parts[2..-1].join(" "))
			when 'spam' then spam_my_followers(parts[1..-1].join(" "))
			when 'elt' then everyones_last_tweet
			when 's' then shorten(parts[1..-1])
			when 'turl' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
			when 'k' then klout_score
			else
				puts "Sorry, I didn't get that #{command}"
			end
		end
	end

	def dm(target, message)
		puts "Trying to send #{target} this direct message:"
		puts "message"
		screen_names = @client.followers.collect { |follower| follower.screen_name }
		if screen_names.include?(target)
			message = "d @#{target} #{message}"
			tweet(message)
		else
			puts "Sorry, you can only DM your followers."
		end
	end

	def followers_list
		screen_names = @client.followers.collect { |follower| follower.screen_name }
	end

	def spam_my_followers(message)
		screen_names = followers_list
		screen_names.each do |follower|
			dm(follower,message)
		end
	end

	def everyones_last_tweet
		friends = @client.friends.sort_by {|friend| friend.screen_name.downcase }
		friends.each do |friend|
			timestamp = friend.status.created_at
			timestamp.strftime("%A, %b %d")
			puts "#{friend.screen_name} said this on #{timestamp}..."
			puts "#{friend.status.text}"
		    puts ""  # Just print a blank line to separate people
	 	end
	 end

	 def shorten(original_url)
	 	puts "Shortening this URL: #{original_url}"
	 	return @bitly.shorten(original_url)
	 end

	 def klout_score
	 	puts "Klout Scores"
	 	friends = @client.friends.collect {|f| f.screen_name}
	 	friends.each do |friend|
	 		puts "#{friend.screen_name}"
	 		identity = Klout::Identity.find_by_screen_name(friend.screen_name)
	 		user = Klout::User.new(identity.id)
	 		puts "#{user.score.score}"
	 	end
	 end


end

blogger = MicroBlogger.new
blogger.run
