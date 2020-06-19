require "json"
require "./order"

class Burst::WalletApi::Models::AllOrders
  include JSON::Serializable

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  @[JSON::Field(key: "openOrders")]
  property open_orders : Array(Order)
end
