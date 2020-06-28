require "json"
require "./transaction"

class Burst::WalletApi::Models::UnconfirmedTransactions
  include JSON::Serializable

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  @[JSON::Field(key: "unconfirmedTransactions")]
  property unconfirmed_transactions : Array(Transaction)
end
