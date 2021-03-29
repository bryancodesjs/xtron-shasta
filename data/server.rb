# myapp.rb
require 'sinatra'
require 'sinatra/reloader'
require 'rest-client'
require 'json'
require 'pry'
require 'rb-readline'

def toBase58(address)
  cmd = "python3 vendors/toBase58.py #{ address.gsub('0x','41') }"
  IO.popen(cmd).readlines[0].chop
rescue
  nil
end


#Get transactions for contract
def get_transactions(account)
  #http://localhost:4567/account/TYyi6KVer7sXUH7pEVsezMZqL22vqALmbd&nocache=true
  started = Time.now
  #server_transaction = 'shastapi.tronscan.org' 
  server_transaction = 'apilist.tronscan.org'

  #contract           = 'TN8RbeAzW7YA5yuFYAVG42qjJR63DsE1ZN'
  #contract           = 'TBLhDkhyXaYESKf9UvB1BQrVXPX6ubjdHo'
  contract           = 'TA4MuGPwQp6RUvD3uUsshZ4FNaYxWRKHbC'

 @doc_transactions    = []
 minimum = 50
 i = 0
 while true
  url_transactions   = "https://#{ server_transaction }/api/contracts/transaction?limit=#{ minimum }&start=#{ i * minimum }&contract=#{ contract }"
  data_transactions  = RestClient.get(url_transactions).body
  doc_transactions   = JSON.parse(data_transactions)
  i += 1
  break if doc_transactions['data'].empty?
  @doc_transactions << doc_transactions
 end


  transactions_dir   = "cache/transactions"
  FileUtils.mkdir_p transactions_dir
  events = []
  ops    = {:cache => 0, :nocache => 0, :total => 0}

  #server_event   = 'api.shasta.trongrid.io'
  server_event   = 'api.trongrid.io'
  #binding.pry

  @doc_transactions.each do |doc_transactions|
    doc_transactions['data'].map { |x| x['txHash'] }.each do |transaction_id|

      ops[:total] +=1 
      puts "Processing Transaction No. #{ ops[:total] } - #{ transaction_id }"
      transaction_file = File.join(transactions_dir,transaction_id)

      if File.exists?(transaction_file) && params[:nocache].nil?
        puts "Yay! File is cached!"
        ops[:cache] +=1
      else  
        ops[:nocache] +=1
    	  url_events    = "https://#{ server_event }/event/transaction/#{ transaction_id }"
        data_events   = RestClient.get(url_events).body
        File.open(transaction_file,'w+') { |f| f.write(data_events) }
      end


      data_events   ||= File.read(transaction_file)

      doc_events     = JSON.parse(data_events)
      events << doc_events
    end
  end

  
  events_normalized = events.reject { |i| i[0]['event_name'] != 'Registration' rescue nil }.reject { |i| i[0].nil? }.map { |i| i[0]['result'] }
  
  #toBase58(address)
  #binding.pry

  #binding.pry
  result = events_normalized.map { |i| { :user_id      => i['userId'].to_i, 
                                         :user         => toBase58(i['user']),
                                         :referrer_id  => i['referrerId'].to_i,  
                                         :referrer     => toBase58(i['referrer']),
                                         :registration => "registration(#{ toBase58(i['user']) },#{ toBase58(i['referrer']) })"
                                       }
                                  }

binding.pry
  ended = Time.now
  puts "Duration: #{ ended - started }"
  
  #binding.pry 
  m1_total = result.map { |i| i[:referrer_id] }.group_by(&:itself).transform_values(&:count)

  m2_referidos_directos = result.reject { |i| i[:referrer] != account }.reverse[0...3]
  m2_referidos_directos = result.reject { |i| i[:referrer] != account }.reverse[0...3]

  {
    "data"      => { "registros" => result },
    "m1"        => { 
      "todos"   => m1_total
    },
    "ops"       => ops,
    "started"   => started, 
    "ended"     => ended, 
    "duration"  => (ended - started)
  }.to_json

end

get '/account/:account' do

  #e5dee054-4292-473e-a339-b8ca125b0714


  #e5dee054-4292-473e-a339-b8ca125b0714
  
=begin
  curl --request GET \
  --url https://api.trongrid.io/v1/contracts/TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t/events \
  --header 'TRON-PRO-API-KEY: 25f66928-0b70-48cd-9ac6-da6f8247c663' 

curl --request GET \
--url https://api.trongrid.io/wallet/triggersmartcontract \
--header 'TRON-PRO-API-KEY: e5dee054-4292-473e-a339-b8ca125b0714' \
--data-raw '{"contract_address":"4100f9825ed065aeb576ec598332f797e0bba01f00","owner_address":"41f036a41c1b38583b72ac0c13ce0bb57eef0cfeaa","function_selector":"usersactiveM1Levels(address,uint8)","parameter":"000000000000000000000000fc632d3d9e4aa4bb384634d32cf78fd30c62cabf0000000000000000000000000000000000000000000000000000000000000009","call_value":0,"fee_limit":150000000}' \
--compressed

request  = RestClient::Request.execute(:method => :get, :url => 'https://api.trongrid.io/wallet/triggersmartcontract', :payload => '{"contract_address":"4100f9825ed065aeb576ec598332f797e0bba01f00","owner_address":"41f036a41c1b38583b72ac0c13ce0bb57eef0cfeaa","function_selector":"usersactiveM1Levels(address,uint8)","parameter":"000000000000000000000000fc632d3d9e4aa4bb384634d32cf78fd30c62cabf0000000000000000000000000000000000000000000000000000000000000009","call_value":0,"fee_limit":150000000}', :timeout => 60, :open_timeout => 60, :headers => { :content_type => "application/json", 'TRON-PRO-API-KEY' => 'e5dee054-4292-473e-a339-b8ca125b0714' } )


curl 'https://api.trongrid.io/wallet/triggersmartcontract' \
  -H 'authority: api.trongrid.io' \
  -H 'sec-ch-ua: "Google Chrome";v="89", "Chromium";v="89", ";Not A Brand";v="99"' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36' \
  -H 'content-type: application/json;charset=UTF-8' \
  -H 'origin: https://xtron.online' \
  -H 'sec-fetch-site: cross-site' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://xtron.online/' \
  -H 'accept-language: en-US,en;q=0.9,es;q=0.8' \
  --data-raw '{"contract_address":"4100f9825ed065aeb576ec598332f797e0bba01f00","owner_address":"41f036a41c1b38583b72ac0c13ce0bb57eef0cfeaa","function_selector":"usersactiveM1Levels(address,uint8)","parameter":"000000000000000000000000fc632d3d9e4aa4bb384634d32cf78fd30c62cabf0000000000000000000000000000000000000000000000000000000000000009","call_value":0,"fee_limit":150000000}' \
  --compressed

  curl 'https://api.tronstack.io/wallet/triggersmartcontract' \
  -H 'Connection: keep-alive' \
  -H 'sec-ch-ua: "Google Chrome";v="89", "Chromium";v="89", ";Not A Brand";v="99"' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36' \
  -H 'Content-Type: application/json;charset=UTF-8' \
  -H 'Origin: https://xtron.online' \
  -H 'Sec-Fetch-Site: cross-site' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Referer: https://xtron.online/' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  --data-raw '{"contract_address":"4100f9825ed065aeb576ec598332f797e0bba01f00","owner_address":"41f036a41c1b38583b72ac0c13ce0bb57eef0cfeaa","function_selector":"usersactiveM1Level(address)","parameter":"000000000000000000000000fc632d3d9e4aa4bb384634d32cf78fd30c62cabf","call_value":0,"fee_limit":150000000}' \
  --compressed
=end
  puts "Processing Account: #{ params[:account] }"
  get_transactions(params[:account])
end
