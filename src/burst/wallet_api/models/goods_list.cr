require "json"
require "./good"

class Burst::WalletApi::Models::GoodsList
  include JSON::Serializable

  property goods : Array(Good)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
