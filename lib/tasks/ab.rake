# -*- coding: utf-8 -*-
namespace :ab do

  REG_EX_NUM = /[[:digit:]]+/

  task :runab, [:c, :n, :urls, :src, :target] => :environment do |t, args|
    run_time = Time.now.utc
    while(true)
      concurrency_num = args[:c]
      request_num = args[:n]
      src = args[:src]
      target = args[:target]
      urls = args[:urls].split(";")
      urls.each do |url|
        ab_info = %x{ab -k -c #{concurrency_num} -n #{request_num} #{url}}
        info = ab_info.split("Time per request")
        if(info.count > 1)
          response_time = REG_EX_NUM.match(info[1])[0].to_i
        else
          response_time = 0 # ab request fail
        end
        puts response_time
        begin
          a = AbInfo.new()
          a.concurrency_num = concurrency_num
          a.request_num = request_num
          a.url = url
          a.response_time = response_time
          a.src = src
          a.target = target
          a.run_time = run_time
          a.save
        rescue Exception => e
          puts e
        end
      end
      end_time = Time.now.utc
      end_min = end_time.min
      end_sec = end_time.sec
      next_sec = 3600 - end_min*60 - end_sec
      run_time = end_time + next_sec.second
      sleep(next_sec)
    end
  end

end