require "json"

class Burst::WalletApi::Models::SubmitNonceResponse
  include JSON::Serializable

  property result : String

  property deadline : UInt64

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
