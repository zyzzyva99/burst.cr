require "json"

class Burst::WalletApi::Models::Subscription
  include JSON::Serializable

  @[JSON::Field(key: "senderRS")]
  property sender_rs : String

  property sender : String

  @[JSON::Field(key: "amountNQT")]
  property amount_nqt : String

  @[JSON::Field(key: "recipientRS")]
  property recipient_rs : String

  property recipient : String

  property id : String

  @[JSON::Field(key: "timeNext")]
  property time_next : Int32

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32?

  property frequency : Int32
end
