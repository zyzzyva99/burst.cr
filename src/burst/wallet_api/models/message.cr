require "json"

class Burst::WalletApi::Models::Message
  include JSON::Serializable

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  property message : String
end
