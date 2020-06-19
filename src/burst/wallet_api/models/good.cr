require "json"

class Burst::WalletApi::Models::Good
  include JSON::Serializable

  property seller : String

  @[JSON::Field(key: "priceNQT")]
  property price_nqt : String

  property quantity : Int32

  property name : String

  property goods : String

  property description : String

  @[JSON::Field(key: "sellerRS")]
  property seller_rs : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32?

  property delisted : Bool

  property tags : String

  property timestamp : Int32

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32?
end
