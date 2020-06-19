require "json"

class Burst::WalletApi::Models::FullHash
  include JSON::Serializable

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  @[JSON::Field(key: "fullHash")]
  property full_hash : String
end
