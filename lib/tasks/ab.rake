# -*- coding: utf-8 -*-

namespace :ab do

  REG_EX_NUM = /[[:digit:]]+/

  task :run, [:src] => :environment do |t, args|
      src = args[:src]

      #src = "本地"
      #target = "测试"


      urls = Url.where("enable=1")

      urls.each do |url|
        if(url.need_date == 1)
          now = Time.now
          end_date = now.to_s.split(" ")[0]
          start_date = (now-30.day).to_s.split(" ")[0]
          test_url = url.url + "&" + start_date + "&" + end_date
          ab_info = %x{ab -c 1 -n 10 #{test_url}}
        else
          start_date = ""
          end_date = ""
          test_url = url.url
          ab_info = %x{ab -c 1 -n 10 #{test_url}}
        end
        info = ab_info.split("Time per request")
        if(info.count > 1)
          response_time = REG_EX_NUM.match(info[1])[0].to_i
        else
          response_time = 0 # ab request fail
        end
        puts response_time
        begin
          a = Log.new
          a.url_id = url.id
          a.concurrency_num = 1
          a.request_num = 10
          a.response_time = response_time
          a.src = src
          if(test_url.include?("54.248.85.234"))
            target = "东京"
          elsif(test_url.include?("115.29.171.153"))
            target = "阿里"
          else
            target = ""
          end
          a.target = target
          a.start_date = start_date
          a.end_date = end_date
          a.save
        rescue Exception => e
          puts e
        end
      end

      urls.each do |url|
        if(url.need_date == 1)
          now = Time.now
          end_date = now.to_s.split(" ")[0]
          start_date = (now-30.day).to_s.split(" ")[0]
          test_url = url.url + "&" + start_date + "&" + end_date
          ab_info = %x{ab -c 5 -n 25 #{test_url}}
        else
          start_date = ""
          end_date = ""
          ab_info = %x{ab -c 5 -n 25 #{url.url}}
        end
        info = ab_info.split("Time per request")
        if(info.count > 1)
          response_time = REG_EX_NUM.match(info[1])[0].to_i
        else
          response_time = 0 # ab request fail
        end
        puts response_time
        begin
          a = Log.new
          a.url_id = url.id
          a.concurrency_num = 1
          a.request_num = 10
          a.response_time = response_time
          a.src = src
          if(test_url.include?("54.248.85.234"))
            target = "东京"
          elsif(test_url.include?("115.29.171.153"))
            target = "阿里"
          else
            target = ""
          end
          a.target = target
          a.start_date = start_date
          a.end_date = end_date
          a.save
        rescue Exception => e
          puts e
        end
      end
  end

end