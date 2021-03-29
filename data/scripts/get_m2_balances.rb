
require 'rest-client'
require 'json'
require 'pry'
require 'rb-readline'






 started = Time.now
 server_transaction = 'apilist.tronscan.org'
 contract           = 'TA4MuGPwQp6RUvD3uUsshZ4FNaYxWRKHbC'
 
 @transactions    = []
 minimum = 50
 i = 0
 while true
  url_transactions   = "https://#{ server_transaction }/api/contracts/transaction?limit=#{ minimum }&start=#{ i * minimum }&contract=#{ contract }"
  data_transactions  = RestClient.get(url_transactions).body
  doc_transactions   = JSON.parse(data_transactions)
  i += 1
  break if doc_transactions['data'].empty?
  @transactions << doc_transactions
 end

 wallets = @transactions.map { |i| i['data'] }.map { |i| i.flatten }.flatten.map { |i| i['ownAddress'] }.uniq



@wallets   = {}

wallets.each do |wallet|
 @transactions_internal = {}
 minimum = 50
 i = 0
 while true
  url_transactions    = "https://#{ server_transaction }/api/internal-transaction?limit=#{ minimum }&start=#{ i * minimum }&address=#{wallet}"
  data_transactions  = RestClient.get(url_transactions).body
  doc_transactions   = JSON.parse(data_transactions)
  i += 1
  break if doc_transactions['data'].empty?
  @transactions_internal[wallet] ||= []
  @transactions_internal[wallet] << doc_transactions
 end
 @wallets[wallet] = @transactions_internal[wallet].map { |i| i['data'].flatten }.flatten.reject { |i| i['rejected'] }.reject { |i| i['call_value'] > 40000000  }.map { |i| i['call_value'].to_i / 1000000 }.sum rescue nil
end

binding.pry


 https://apilist.tronscan.org/api/internal-transaction?limit=200&start=51&address=TYyi6KVer7sXUH7pEVsezMZqL22vqALmbd
 binding.pry
