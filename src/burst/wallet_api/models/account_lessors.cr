require "json"
require "./lessor"

class Burst::WalletApi::Models::AccountLessors
  include JSON::Serializable

  property lessors : Array(Lessor)

  @[JSON::Field(key: "accountRS")]
  property account_rs : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  property account : String

  property height : Int32
end
