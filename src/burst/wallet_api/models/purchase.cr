require "json"
require "./note"

class Burst::WalletApi::Models::Purchase
  include JSON::Serializable

  property seller : String

  @[JSON::Field(key: "priceNQT")]
  property price_nqt : String

  property quantity : Int32

  @[JSON::Field(key: "deliveryDeadlineTimestamp")]
  property delivery_deadline_timestamp : Int32

  @[JSON::Field(key: "buyerRS")]
  property buyer_rs : String

  property pending : Bool

  property purchase : String

  property name : String

  property goods : String

  @[JSON::Field(key: "sellerRS")]
  property seller_rs : String

  property buyer : String

  property timestamp : Int32

  property note : Note?

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32?
end
