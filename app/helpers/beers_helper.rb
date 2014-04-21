module BeersHelper
	def check_beer(beer_id)
		Beer.find_by(beer_id: beer_id)
	end
end
