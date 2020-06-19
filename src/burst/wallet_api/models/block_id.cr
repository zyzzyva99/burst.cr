require "json"

class Burst::WalletApi::Models::BlockId
  include JSON::Serializable

  property block : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
