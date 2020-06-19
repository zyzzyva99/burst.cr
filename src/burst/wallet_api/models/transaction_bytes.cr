require "json"

class Burst::WalletApi::Models::TransactionBytes
  include JSON::Serializable

  @[JSON::Field(key: "unsignedTransactionBytes")]
  property unsigned_transaction_bytes : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  property confirmations : Int32

  @[JSON::Field(key: "transactionBytes")]
  property transaction_bytes : String
end
