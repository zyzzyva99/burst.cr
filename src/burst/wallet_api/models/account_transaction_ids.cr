require "json"

class Burst::WalletApi::Models::AccountTransactionIds
  include JSON::Serializable

  @[JSON::Field(key: "transactionIds")]
  property transaction_ids : Array(String)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
