module UsersHelper
	# Returns the Gravatar (http://gravatar.com/) for the given user.
  	#def gravatar_for(user, options = { size: 30, :class => 'gravatar' }.merge!)
	#    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
	#    size = options[:size]
	#    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
	#    image_tag(gravatar_url, alt: user.name)
  	#end

  	def gravatar_for user, options = {}
	    options = {:alt => 'avatar', :class => 'avatar', :size => 30}.merge! options
	    id = Digest::MD5::hexdigest user.email.downcase
	    url = 'http://www.gravatar.com/avatar/' + id + '.jpg?s=' + options[:size].to_s
	    options.delete :size
	    image_tag url, options
	end
end
