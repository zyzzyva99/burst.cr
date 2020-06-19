require "json"
require "./order"

class Burst::WalletApi::Models::AskOrders
  include JSON::Serializable

  @[JSON::Field(key: "askOrders")]
  property ask_orders : Array(Order)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
