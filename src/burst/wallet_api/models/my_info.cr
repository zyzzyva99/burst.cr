require "json"

class Burst::WalletApi::Models::MyInfo
  include JSON::Serializable

  property address : String

  property host : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
