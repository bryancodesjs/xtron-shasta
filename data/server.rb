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
  started = Time.now
  server_transaction = 'shastapi.tronscan.org'  
  #contract           = 'TN8RbeAzW7YA5yuFYAVG42qjJR63DsE1ZN'
  contract           = 'TBLhDkhyXaYESKf9UvB1BQrVXPX6ubjdHo'
  url_transactions   = "https://#{ server_transaction }/api/contracts/transaction?limit=1000&start=0&contract=#{ contract }"
  data_transactions  = RestClient.get(url_transactions).body
  doc_transactions   = JSON.parse(data_transactions)

  transactions_dir   = "cache/transactions"
  FileUtils.mkdir_p transactions_dir
  events = []
  ops    = {:cache => 0, :nocache => 0, :total => 0}

  server_event   = 'api.shasta.trongrid.io'
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

  
  events_normalized = events.reject { |i| i[0]['event_name'] != 'Registration' rescue nil }.reject { |i| i[0].nil? }.map { |i| i[0]['result'] }
  
  #toBase58(address)
  #binding.pry

  #binding.pry
  result = events_normalized.map { |i| { :user_id     => i['userId'].to_i, 
                                         :user        => toBase58(i['user']),
                                         :referrer_id => i['referrerId'].to_i,  
                                         :referrer    => toBase58(i['referrer'])
                                       }
                                  }

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
  binding.pry
  puts "Processing Account: #{ params[:account] }"
  get_transactions(params[:account])
end
