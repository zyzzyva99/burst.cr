require "json"

class Burst::WalletApi::Models::MiningInfo
  include JSON::Serializable

  @[JSON::Field(key: "generationSignature")]
  property generation_signature : String

  @[JSON::Field(key: "baseTarget")]
  property base_target : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  property height : String
end
