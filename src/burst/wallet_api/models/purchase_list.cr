require "json"
require "./purchase"

class Burst::WalletApi::Models::PurchaseList
  include JSON::Serializable

  property purchases : Array(Purchase)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
