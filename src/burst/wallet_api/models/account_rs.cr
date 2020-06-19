require "json"

class Burst::WalletApi::Models::AccountRs
  include JSON::Serializable

  @[JSON::Field(key: "accountRS")]
  property account_rs : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  property account : String
end
