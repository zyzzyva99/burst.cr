require "json"

class Burst::WalletApi::Models::EncryptedMessage
  include JSON::Serializable

  property data : String

  @[JSON::Field(key: "requestProcessingTime")]
  property request_processing_time : Int32

  property nonce : String
end
