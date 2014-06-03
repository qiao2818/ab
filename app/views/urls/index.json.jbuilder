json.array!(@urls) do |url|
  json.extract! url, :id, :url, :enable, :need_date
  json.url url_url(url, format: :json)
end
