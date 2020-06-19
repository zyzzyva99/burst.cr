require "json"

class Burst::WalletApi::Models::PublicKey
  include JSON::Serializable

  @[JSON::Field(key: "publicKey")]
  property public_key : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32
end
