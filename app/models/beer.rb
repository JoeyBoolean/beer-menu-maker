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
	def check_beer(beer_id)
		find_by(beer_id: beer_id)
	end
end
