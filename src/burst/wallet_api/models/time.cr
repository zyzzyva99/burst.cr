require "json"

class Burst::WalletApi::Models::Time
  include JSON::Serializable

  property time : Int32

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
