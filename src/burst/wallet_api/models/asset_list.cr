require "json"
require "./asset"

class Burst::WalletApi::Models::AssetList
  include JSON::Serializable

  property assets : Array(Asset)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
