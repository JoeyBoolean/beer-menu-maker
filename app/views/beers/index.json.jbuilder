json.array!(@beers) do |beer|
  json.extract! beer, :id, :beer_id
  json.url beer_url(beer, format: :json)
end
