require "json"

class Burst::WalletApi::Models::Asset
  include JSON::Serializable

  @[JSON::Field(key: "quantityQNT")]
  property quantity_qnt : String

  @[JSON::Field(key: "numberOfAccounts")]
  property number_of_accounts : Int32

  @[JSON::Field(key: "accountRS")]
  property account_rs : String

  property decimals : Int32

  @[JSON::Field(key: "numberOfTransfers")]
  property number_of_transfers : Int32

  property name : String

  property description : String

  @[JSON::Field(key: "numberOfTrades")]
  property number_of_trades : Int32

  property asset : String

  property account : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32?
end
