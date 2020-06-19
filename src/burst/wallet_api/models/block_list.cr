require "json"
require "./block"

class Burst::WalletApi::Models::BlockList
  include JSON::Serializable

  property blocks : Array(Block)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
