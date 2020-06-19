require "json"
require "./account_asset"

class Burst::WalletApi::Models::AccountAssets
  include JSON::Serializable

  @[JSON::Field(key: "accountAssets")]
  property account_assets : Array(AccountAsset)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
