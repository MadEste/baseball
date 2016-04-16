json.array!(@leagues) do |league|
  json.extract! league, :id, :title
  json.url league_url(league, format: :json)
end
