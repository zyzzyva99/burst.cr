require "json"

class Burst::WalletApi::Models::Order
  include JSON::Serializable

  @[JSON::Field(key: "quantityQNT")]
  property quantity_qnt : String

  @[JSON::Field(key: "priceNQT")]
  property price_nqt : String

  @[JSON::Field(key: "accountRS")]
  property account_rs : String

  property asset : String

  @[JSON::Field(key: "type")]
  property order_type : String

  property account : String

  property order : String

  property height : Int32

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32?
end
