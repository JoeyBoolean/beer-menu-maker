require '../lib/brewerydb'


	puts "Search for: "
	search = gets
	search = search.chomp
	search = search.gsub(" ", "+")

	result = BreweryDb.search(search)
	
	print "\nName: " + result[0]["name"] + "\n"
	print "Abv: " + result[0]["abv"] + "\n"
	print "Desc: " + result[0]["description"] + "\n"