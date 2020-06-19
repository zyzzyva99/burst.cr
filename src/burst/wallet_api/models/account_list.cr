require "json"

class Burst::WalletApi::Models::AccountList
  include JSON::Serializable

  property accounts : Array(String)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
