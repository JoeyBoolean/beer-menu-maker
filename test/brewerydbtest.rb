require '../lib/brewerydb'

class BreweryDbTest

@@beer_ids = ["oeGSxs"]		
@@results = nil

	def self.search()
		puts "Search for: "
		search = gets
		search = search.chomp
		search = search.gsub(" ", "+")
		result = BreweryDb.search_beer(search)
		add_beer_ids(result[0]["id"])
		set_beer_results(result)
		result.each { |a| print_beer a}
	end

	def self.print_beer(result)
		print "\nID: " + result["id"]
		print "\nName: " + result["name"] + "\n"
		if result["abv"]
			print ("Abv: " + result["abv"] + "\n")
		end
		if result["description"]
			print "Desc: " + result["description"] + "\n"
		end
	end

	def self.get_beer_by_id(result)

		result = BreweryDb.get_beer_by_id(result[0]["id"])
		print_beer(result)
	end

	def self.get_beers_by_ids(ids)

		result = BreweryDb.get_beers_by_ids(ids)
		result.each { |a| print_beer a }
		# print result
	end

	def self.beer_ids
		@@beer_ids
	end

	def self.add_beer_ids(id)
		@@beer_ids.push(id)
	end

	def self.beer_results
		@@results
	end

	def self.set_beer_results(results)
		@@results = results
	end

search()
get_beer_by_id(beer_results)
get_beers_by_ids(beer_ids)

end