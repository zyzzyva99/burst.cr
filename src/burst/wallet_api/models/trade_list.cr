require "json"
require "./trade"

class Burst::WalletApi::Models::TradeList
  include JSON::Serializable

  property trades : Array(Trade)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
