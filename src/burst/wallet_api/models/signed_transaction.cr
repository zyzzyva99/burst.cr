require "json"
require "./transaction"

class Burst::WalletApi::Models::SignedTransaction
  include JSON::Serializable

  @[JSON::Field(key: "signatureHash")]
  property signature_hash : String

  @[JSON::Field(key: "unsignedTransactionBytes")]
  property unsigned_transaction_bytes : String

  @[JSON::Field(key: "transactionJSON")]
  property transaction : Transaction

  property broadcasted : Bool

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  @[JSON::Field(key: "transactionBytes")]
  property transaction_bytes : String

  @[JSON::Field(key: "fullHash")]
  property full_hash : String?

  property transaction : String
end
