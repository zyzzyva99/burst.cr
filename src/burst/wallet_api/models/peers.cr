require "json"

class Burst::WalletApi::Models::Peers
  include JSON::Serializable

  property peers : Array(String)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
