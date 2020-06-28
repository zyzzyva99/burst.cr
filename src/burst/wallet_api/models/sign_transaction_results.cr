require "json"

class Burst::WalletApi::Models::SignTransactionResult
  include JSON::Serializable

  @[JSON::Field(key: "signatureHash")]
  property signature_hash : String

  property verify : Bool

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  @[JSON::Field(key: "transactionBytes")]
  property transaction_bytes : String

  @[JSON::Field(key: "fullHash")]
  property full_hash : String

  property transaction : String
end
