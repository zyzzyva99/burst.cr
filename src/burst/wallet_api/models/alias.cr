require "json"

class Burst::WalletApi::Models::Alias
  include JSON::Serializable

  @[JSON::Field(key: "aliasURI")]
  property alias_uri : String

  @[JSON::Field(key: "aliasName")]
  property alias_name : String

  @[JSON::Field(key: "accountRS")]
  property account_rs : String

  @[JSON::Field(key: "alias")]
  property burst_wallet_api_models_alias_alias : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32?

  property account : String

  property timestamp : Int32
end
