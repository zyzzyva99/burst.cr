require "json"

class Burst::WalletApi::Models::Transaction
  include JSON::Serializable

  @[JSON::Field(key: "senderPublicKey")]
  property sender_public_key : String

  property signature : String

  @[JSON::Field(key: "feeNQT")]
  property fee_nqt : String

  @[JSON::Field(key: "type")]
  property transaction_type : Int32

  property confirmations : Int32?

  @[JSON::Field(key: "fullHash")]
  property full_hash : String

  property version : Int32

  @[JSON::Field(key: "ecBlockId")]
  property ec_block_id : String

  @[JSON::Field(key: "signatureHash")]
  property signature_hash : String

  property attachment : JSON::Any?

  @[JSON::Field(key: "senderRS")]
  property sender_rs : String

  property subtype : Int32

  @[JSON::Field(key: "amountNQT")]
  property amount_nqt : String

  property sender : String

  @[JSON::Field(key: "recipientRS")]
  property recipient_rs : String?

  property recipient : String?

  @[JSON::Field(key: "ecBlockHeight")]
  property ec_block_height : Int32

  property block : String?

  @[JSON::Field(key: "blockTimestamp")]
  property block_timestamp : Int32?

  property deadline : Int32

  property transaction : String

  property timestamp : Int32

  property height : Int32
end
