# -*- coding: utf-8 -*-

namespace :ab do

  REG_EX_NUM = /[[:digit:]]+/

  task :runab, [:c, :n, :urls, :src, :target] => :environment do |t, args|

    while(true)
      inserts = []
      concurrency_num = args[:c]
      request_num = args[:n]
      src = args[:src]
      target = args[:target]
      urls = args[:urls].split(";")

      puts urls

      urls.each do |url|
        ab_info = %x{ab -c #{concurrency_num} -n #{request_num} #{url}}
        info = ab_info.split("Time per request")
        response_time = REG_EX_NUM.match(info[1])[0].to_i
        puts response_time
        #created_at = Time.now
        #updated_at = created_at
        #inserts.push "(#{concurrency_num},#{request_num},#{time_per_request},#{url},#{created_at}),#{updated_at}"
        a = AbInfo.new()
        a.concurrency_num = concurrency_num
        a.request_num = request_num
        a.url = url
        a.response_time = response_time
        a.src = src
        a.target = target
        a.save
      end
      #
      #sql = "INSERT INTO ab_info (`concurrency_num`, `request_num`, `time_per_request`, `url`, `created_at`, `updated_at`) VALUES #{inserts.join(", ")}"
      #
      #puts "++++++++"
      #puts sql
      #puts "++++++++"
      #
      #ActiveRecord::Base.connection.execute(sql)
      sleep(3600)
    end
  end

end