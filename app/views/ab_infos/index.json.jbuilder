json.array!(@ab_infos) do |ab_info|
  json.extract! ab_info, :id, :concurrency_num, :request_num, :response_time, :url, :src, :target
  json.url ab_info_url(ab_info, format: :json)
end
