require 'rubygems'
require 'json'
require 'net/http'
require 'uri'

class BreweryDb

	def self.get_api()
		api = { :api_string => "http://api.brewerydb.com/v2/", :api_key => "key=d0368b07f3cde7762242dcf7e50fdb03"}
		return api
	end


	def self.search_beer(query)
		api = get_api()
		uri = URI.parse(api[:api_string] + "search?q=" + query + "&type=beer&" + api[:api_key])
		response = Net::HTTP.get_response uri
		print uri
		result = JSON.parse(response.body)
		data = result ["data"]
		return data
	end

	def self.get_beer_by_id(id)
		api = get_api()
		uri = URI.parse(api[:api_string] + "beer/" + id + "?" + api[:api_key])
		print uri
		response = Net::HTTP.get_response uri
		result = JSON.parse(response.body)
		data = result ["data"]
		return data
	end

	def self.get_beers_by_ids(ids)
		api = get_api()
		print ids
		str_ids = ids.join(',')
		print str_ids
		uri = URI.parse(api[:api_string] + "beers?ids=" + str_ids + "&" + api[:api_key])
		print uri
		response = Net:: HTTP.get_response uri
		result = JSON.parse(response.body)
		data = result ["data"]
		return data
	end
end