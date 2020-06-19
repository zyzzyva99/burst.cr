require "json"

class Burst::WalletApi::Models::AccountBlockIds
  include JSON::Serializable

  @[JSON::Field(key: "blockIds")]
  property block_ids : Array(String)

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
