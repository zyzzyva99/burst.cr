require "json"

class Burst::WalletApi::Models::Transfer
  include JSON::Serializable

  @[JSON::Field(key: "quantityQNT")]
  property quantity_qnt : String

  @[JSON::Field(key: "senderRS")]
  property sender_rs : String

  @[JSON::Field(key: "assetTransfer")]
  property asset_transfer : String

  property sender : String

  @[JSON::Field(key: "recipientRS")]
  property recipient_rs : String

  property decimals : Int32

  property recipient : String

  property name : String

  property asset : String

  property height : Int32

  property timestamp : Int32
end
