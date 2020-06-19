require "json"
require "./transaction"

class Burst::WalletApi::Models::AccountTransactions
  include JSON::Serializable

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  property transactions : Array(Transaction)
end
