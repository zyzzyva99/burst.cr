require "json"

class Burst::WalletApi::Models::UnconfirmedTransactionIds
  include JSON::Serializable

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  @[JSON::Field(key: "unconfirmedTransactionIds")]
  property unconfirmed_transaction_ids : Array(JSON::Any?)
end
