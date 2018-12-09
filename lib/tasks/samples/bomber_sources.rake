namespace :samples do
  task bomber_sources: :environment do
    puts 'start create bomber_sources'

    BomberSource.find_or_create_by(title: '杭州地铁') do |bomber_source|
      bomber_source.url = 'https://hzmetro.dtdream.com/hzmetro2-web/new/client/phone'
      bomber_source.method = 'method_post'
      bomber_source.headers = JSON.parse "{\"Content-Type\": \"application/x-www-form-urlencoded\"}"
      bomber_source.params = JSON.parse "{\"op\": \"sendRegVerifyCode\"}"
      bomber_source.data = JSON.parse "{\"userName\": \"_phone_number_\"}"
      bomber_source.result = JSON.parse "{\"msg\": \"成功\", \"status\": 0}"
    end

    puts 'finished create bomber_sources'
  end
end
