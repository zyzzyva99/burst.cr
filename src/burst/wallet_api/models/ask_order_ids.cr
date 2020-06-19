require "json"

class Burst::WalletApi::Models::AskOrderIds
  include JSON::Serializable

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  @[JSON::Field(key: "askOrderIds")]
  property ask_order_ids : Array(String)
end
