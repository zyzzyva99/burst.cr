require "json"

class Burst::WalletApi::Models::EcBlock
  include JSON::Serializable

  @[JSON::Field(key: "ecBlockHeight")]
  property ec_block_height : Int32

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  @[JSON::Field(key: "ecBlockId")]
  property ec_block_id : String

  property timestamp : Int32
end
