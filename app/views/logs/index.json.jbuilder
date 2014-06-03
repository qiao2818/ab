json.array!(@logs) do |log|
  json.extract! log, :id, :concurrency_num, :request_num, :start_date, :end_date, :src, :target, :url_id
  json.url log_url(log, format: :json)
end
