json.array!(@results) do |result|
  json.extract! result, :keyword, :index, :uri, :host, :visible_uri, :title, :snippet
  json.url result_url(result, format: :json)
end
