require "json"

class Burst::WalletApi::Models::BroadcastResult
  include JSON::Serializable

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  @[JSON::Field(key: "fullHash")]
  property full_hash : String

  property transaction : String
end
