require 'brewerydb'
class Beer < ActiveRecord::Base
	
	@beer_info

	def set_beer_info(name)
		@beer_info = name
		puts name
	end

	def get_beer_info()
		@beer_info
	end
end
