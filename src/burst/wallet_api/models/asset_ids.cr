require "json"

class Burst::WalletApi::Models::AssetIds
  include JSON::Serializable

  @[JSON::Field(key: "assetIds")]
  property asset_ids : Array(String)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
