require "json"

class Burst::WalletApi::Models::AccountId
  include JSON::Serializable

  @[JSON::Field(key: "accountRS")]
  property account_rs : String

  @[JSON::Field(key: "publicKey")]
  property public_key : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  property account : String
end
